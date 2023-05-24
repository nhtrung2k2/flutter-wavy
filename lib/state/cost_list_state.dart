import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:wavy/model/cost.dart';
import 'package:wavy/model/item.dart';
import 'package:wavy/utils/convertBase64Image.dart';

enum CostListStatus {
  loading,
  success,
  failure,
  updating,
  updated,
  failedUpdated,
  uploadedImage,
  failedUploadImageMore3,
  removedImage
}

class CostListState {
  final Cost? cost;
  final CostListStatus costListStatus;
  final List<XFile> newImages;

  const CostListState({
    required this.cost,
    required this.costListStatus,
    this.newImages = const []
  });
  factory CostListState.initial() => const CostListState(
    cost: null,
    costListStatus: CostListStatus.loading,
    newImages: []
  );

  CostListState copyWith({
    Cost? cost,
    CostListStatus? costListStatus,
    List<XFile>? newImages
  }) {
    return CostListState(
      cost: cost ?? this.cost,
      costListStatus: costListStatus ?? this.costListStatus,
      newImages: newImages ?? this.newImages
    );
  }

  int totalCost(){
    int totalCost = 0;
    for(Item itemCost in (cost?.items ?? [])) {
      totalCost = totalCost + itemCost.itemAmount;
    }
    totalCost = (cost?.labourCost ?? 0) + ((cost?.hourlyWave ?? 0) * (cost?.hourWorking ?? 0)) + totalCost;
    return totalCost;
  }

  List<dynamic> getOnlyOldImage(){
    List images = [];

    if(cost?.picture1!=null) images.add(convertBase64Image(cost?.picture1 ?? ''));
    if(cost?.picture2!=null) images.add(convertBase64Image(cost?.picture2 ?? ''));
    if(cost?.picture3!=null) images.add(convertBase64Image(cost?.picture3 ?? ''));

    return images;
  }

  List<dynamic> getImages(){
    List images = [];

    if(cost?.picture1!=null) images.add(convertBase64Image(cost?.picture1 ?? ''));
    if(cost?.picture2!=null) images.add(convertBase64Image(cost?.picture2 ?? ''));
    if(cost?.picture3!=null) images.add(convertBase64Image(cost?.picture3 ?? ''));

    images.addAll(newImages);

    while(images.length<3) {
      images.add(null);
    }
    return images;
  }

  List<dynamic> getImagesToUpload(){
    List images = [];

    if(cost?.picture1!=null) images.add(cost?.picture1);
    if(cost?.picture2!=null) images.add(cost?.picture2);
    if(cost?.picture3!=null) images.add(cost?.picture3);

    images.addAll(newImages);

    while(images.length<3) {
      images.add(null);
    }
    return images;
  }

  int indexOfPicture(index){
    if(index==0){
      if(cost?.picture1!=null) return 1;
      if(cost?.picture2!=null) return 2;
      if(cost?.picture3!=null) return 3;
    }

    if(index==1){
      if(cost?.picture1!=null && cost?.picture2!=null) return 2;
      if(cost?.picture1!=null && cost?.picture3!=null) return 3;
      if(cost?.picture2!=null && cost?.picture3!=null) return 3;
    }
    if(index==2){
      if(cost?.picture1!=null && cost?.picture2!=null && cost?.picture3!=null) return 3;
    }

    return -1;
  }

}
