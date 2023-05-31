import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wavy/event/cost_list_event.dart';
import 'package:wavy/model/cost.dart';
import 'package:wavy/model/item.dart';
import 'package:wavy/repository/cost_list_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/cost_list_state.dart';

const maxUploadImageCount = 3;

class CostListBloc extends Bloc<CostListEvent, CostListState> {

  final CostListRepository _costListRepository = ServiceLocator.locator.get<CostListRepository>();

  CostListBloc() : super(CostListState.initial()) {
    on<FetchCostListDataEvent>(_onFetchingData);
    on<UploadImagesEvent>(_onUploadImages);
    on<RemoveImageEvent>(_onRemoveImage);
    on<UpdateCostListEvent>(_onUpdateCostList);
    on<AddNewItemEvent>(_onAddNewItem);
    on<ChangePriceItemEvent>(_onChangePrice);
    on<RemoveItemEvent>(_onRemoveItem);
  }

  Future<void> _onFetchingData(
    FetchCostListDataEvent event,
    Emitter<CostListState> emit,
  ) async {

    emit(state.copyWith(
      costListStatus: CostListStatus.loading
    ));

    try {

      Cost costData = await _costListRepository.fetchCost(event.amountId);

      emit(state.copyWith(
        cost: costData,
        newImages: [],
        costListStatus: CostListStatus.success
      ));
    } catch (e) {
      emit(state.copyWith(
        newImages: [],
        costListStatus: CostListStatus.failure
      ));
    }

  }

  Future<void> _onUploadImages(
      UploadImagesEvent event,
      Emitter<CostListState> emit,
      ) async {

    if((state.getImages().where((element) => element!=null).length + event.files.length)>maxUploadImageCount){
      emit(state.copyWith(
        costListStatus: CostListStatus.failedUploadImageMore3
      ));
    }
    else{
      emit(state.copyWith(
        newImages: state.newImages + event.files,
        costListStatus: CostListStatus.uploadedImage
      ));
    }

  }

  Future<void> _onRemoveImage(
      RemoveImageEvent event,
      Emitter<CostListState> emit,
      ) async {

    if(event.index<state.getOnlyOldImage().length){
      Cost newCost = state.cost!;
      int whichPicture = state.indexOfPicture(event.index);
      if(whichPicture==1) {
        newCost = state.cost!.copyWith(
          picture1: null
        );
      }
      else if(whichPicture==2){
        newCost = state.cost!.copyWith(
            picture2: null
        );
      }
      else if(whichPicture==3){
        newCost = state.cost!.copyWith(
            picture3: null
        );
      }
      emit(state.copyWith(
        cost: newCost
      ));
    }
    else{
      var newList = state.newImages;
      newList.removeAt(event.index-state.getOnlyOldImage().length);
      emit(state.copyWith(
        newImages: newList,
        costListStatus: CostListStatus.removedImage
      ));
    }

  }

  Future<void> _onUpdateCostList(
      UpdateCostListEvent event,
      Emitter<CostListState> emit,
      ) async {

    emit(state.copyWith(
      costListStatus: CostListStatus.updating
    ));

    try {
      List<String?> images = [];

      for(var image in state.getImagesToUpload()){
        if(image.runtimeType == XFile){
          images.add('data:image/png;base64,${base64Encode(await (image as XFile).readAsBytes())}');
        }
        else{
          images.add(image==null?null:'$image');
        }
      }

      Cost newCost = state.cost!.copyWith(
        picture1: images[0],
        picture2: images[1],
        picture3: images[2]
      );
      
      Response updateCostListResponse = await _costListRepository.updateCostList(event.amountId, newCost);

      emit(state.copyWith(
          costListStatus: updateCostListResponse.statusCode==200 ? CostListStatus.updated : CostListStatus.failedUpdated
      ));
    } catch (e) {
      emit(state.copyWith(
          costListStatus: CostListStatus.failedUpdated
      ));
    }

  }

  Future<void> _onAddNewItem(
      AddNewItemEvent event,
      Emitter<CostListState> emit,
      ) async {

    List<Item> items = [];
    items.addAll(state.cost?.items ?? []);
    items.add(Item(itemId: event.itemId, itemName: itemCost.singleWhere((element) => element['id']==event.itemId)['name'], itemAmount: 0));
    
    emit(state.copyWith(
      cost: state.cost!.copyWith(
        items: items
      ),
      costListStatus: CostListStatus.updatedItem
    ));

  }

  Future<void> _onChangePrice(
      ChangePriceItemEvent event,
      Emitter<CostListState> emit,
      ) async {

    List<Item> items = [];
    List<Item> oldItems = state.cost?.items ?? [];
    for(int i = 0; i < oldItems.length; i++){
      if(event.index == i){
        items.add(oldItems[i].copyWith(itemAmount: event.price));
      }
      else {
        items.add(oldItems[i]);
      }
    }

    emit(state.copyWith(
        cost: state.cost!.copyWith(
            items: items
        ),
        costListStatus: CostListStatus.priceChanging
    ));

  }

  Future<void> _onRemoveItem(
      RemoveItemEvent event,
      Emitter<CostListState> emit,
      ) async {

    List<Item> items = [];
    items.addAll(state.cost?.items ?? []);
    items.removeAt(event.index);

    emit(state.copyWith(
        cost: state.cost!.copyWith(
            items: items
        ),
        costListStatus: CostListStatus.updatedItem
    ));

  }

}