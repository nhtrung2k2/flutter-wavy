import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:wavy/bloc/cost_list_bloc.dart';
import 'package:wavy/event/cost_list_event.dart';
import 'package:wavy/model/item.dart';
import 'package:wavy/state/cost_list_state.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/add_more_items_components/add_more_items_component.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/custom_dialog.dart';
import 'package:wavy/view/components/custom_input_field.dart';
import 'package:wavy/view/components/custom_ouline_button.dart';
import 'package:wavy/view/pages/login.dart';
import 'package:wavy/view/pages/register_baby_sister_schedule.dart';

class CostList extends StatefulWidget {
  final int amountId;

  const CostList({
    required this.amountId,
    super.key,
  });

  @override
  State<CostList> createState() => _CostListState();
}

class _CostListState extends State<CostList> {
  late CostListBloc costListBloc;
  final List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    costListBloc = context.read<CostListBloc>();
    costListBloc.add(FetchCostListDataEvent(amountId: widget.amountId));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      costListBloc.stream.listen((state) {
        if (state.costListStatus == CostListStatus.failedUploadImageMore3) {
          _showPopup(context);
        } else if (state.costListStatus == CostListStatus.updated) {
          _showToast('Success');
        } else if (state.costListStatus == CostListStatus.failedUpdated) {
          _showToast('Failed');
        } else if (state.costListStatus == CostListStatus.success ||
            state.costListStatus == CostListStatus.updatedItem) {
          controllers.clear();
          for (Item item in (state.cost?.items ?? [])) {
            controllers.add(TextEditingController(
                text: item.itemAmount == 0
                    ? ''
                    : NumberFormat('###,###').format(item.itemAmount)));
          }
        }
      });
    });
  }

  _showPopup(context) {
    CustomDialog().show(context,
        title: 'Upload image failed',
        message: 'Only upload three images',
        actions: [CustomDialogAction(actionContent: 'OK', onAction: () {})]);
  }

  _showToast(String message) {
    if (mounted)
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    var costListState = context.select((CostListBloc bloc) => bloc.state);

    return Scaffold(
      appBar: CustomAppBar(
          textColor: CustomColors.blueDark,
          nameTitle: "costList".tr(),
          haveBackButton: true,
          backgroundColorAppBar: CustomColors.blueLight),
      body: costListState.costListStatus == CostListStatus.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocListener<CostListBloc, CostListState>(
                  listener: (context, state) {
                    if (state.errorMessage != null) {
                      showErrorDialog(context, "error".tr(),
                          state.errorMessage.toString().tr(), "yes".tr(), () {
                        context.pop();
                      });
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: '${'date'.tr()} : ',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: costListState.cost?.amountDate ?? '',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Roboto",
                            ),
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        "costList".tr(),
                        style: const TextStyle(
                            color: CustomColors.bluetext,
                            fontSize: 14,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      singleCostItem('labourCost'.tr(),
                          costListState.cost?.labourCost ?? 0),
                      const SizedBox(
                        height: 16.0,
                      ),
                      workingTimeCost(costListState),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Column(
                          children: List.generate(
                              (costListState.cost?.items ?? []).length,
                              (index) => Column(
                                    children: [
                                      singleCostItem(
                                        (costListState.cost?.items ?? [])[index]
                                            .itemName
                                            .tr(),
                                        (costListState.cost?.items ?? [])[index]
                                            .itemAmount,
                                        index: index,
                                        canRemove: true,
                                      ),
                                      const SizedBox(
                                        height: 16.0,
                                      ),
                                    ],
                                  ))),
                      const SizedBox(
                        height: 8.0,
                      ),
                      AddMoreItemsComponents(
                        itemList: itemCost.sublist(4, 8),
                        onPicked: (item) {
                          costListBloc.add(AddNewItemEvent(itemId: item['id']));
                        },
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: '${'total'.tr()} :',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: "Roboto",
                              ),
                            ),
                            TextSpan(
                              text: NumberFormat('####,###VND')
                                  .format(costListState.totalCost()),
                              style: const TextStyle(
                                  color: CustomColors.redText,
                                  fontSize: 14,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      _uploadImage(costListState),
                      const SizedBox(
                        height: 20.0,
                      ),
                      _submitButton(
                          title: 'confirmSchedule',
                          onPress: () => _onSubmitSchedule())
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget singleCostItem(String content, int price,
          {bool canRemove = false, int index = -1}) =>
      baseCostItem(
          Text(
            content,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            ),
          ),
          price,
          canRemove, onTap: () {
        if (canRemove) costListBloc.add(RemoveItemEvent(index: index));
      }, index: index);

  Widget workingTimeCost(CostListState state) => baseCostItem(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisSize: MainAxisSize.min, children: [
            Text(
              '${'workingTime'.tr()} : ',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Roboto",
              ),
            ),
            SizedBox(
              width: 50.resizewidth(context),
              child: CustomOutLineButton(
                  title: '${state.cost?.from}',
                  vertical: 0,
                  horizontal: 0,
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                  borderSideColor: CustomColors.blueBorder,
                  borderRadius: 8,
                  widthRadius: 1,
                  onPressed: () {
                    TimeOfDay? timeStart;
                    customshowTimePicker(context).then((value) => {
                          timeStart = value,
                          context.read<CostListBloc>().add(
                              OnChangeTime(time: Time.start, value: timeStart))
                        });
                  }),
            ),
            SizedBox(
              width: 8.resizewidth(context),
            ),
            const Text(
              '~',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Roboto",
              ),
            ),
            SizedBox(
              width: 8.resizewidth(context),
            ),
            SizedBox(
              width: 50.resizewidth(context),
              child: CustomOutLineButton(
                  title: '${state.cost?.to}',
                  vertical: 0,
                  horizontal: 0,
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                  borderSideColor: CustomColors.blueBorder,
                  borderRadius: 8,
                  widthRadius: 1,
                  onPressed: () {
                    TimeOfDay? timeEnd;
                    customshowTimePicker(context).then((value) => {
                          timeEnd = value,
                          context
                              .read<CostListBloc>()
                              .add(OnChangeTime(time: Time.end, value: timeEnd))
                        });
                  }),
            ),
          ]),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            '${state.cost?.hourWorking} ${'hours'.tr()} - ${NumberFormat('###,###').format(state.cost?.hourlyWave)}VND/h',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            ),
          )
        ],
      ),
      ((state.cost?.hourWorking ?? 0) * (state.cost?.hourlyWave ?? 0)).toInt(),
      false);

  Widget baseCostItem(Widget content, int price, bool canRemove,
      {Function? onTap, int index = -1}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: content),
        const SizedBox(
          width: 10.0,
        ),
        canRemove
            ? SizedBox(
                width: 200,
                child: CustomInputField(
                  controller: index >= 0 ? controllers[index] : null,
                  inputType: InputType.currency,
                  onChanged: (value) {
                    costListBloc.add(ChangePriceItemEvent(
                        index: index >= 0 ? index : -1,
                        price: int.parse(value.replaceAll(',', ''))));
                  },
                ),
              )
            : Text(
                NumberFormat('###,###').format(price),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: "Roboto",
                ),
              ),
        const SizedBox(
          width: 10.0,
        ),
        SizedBox(
          height: 22,
          width: 22,
          child: Visibility(
              visible: canRemove,
              child: GestureDetector(
                onTap: () {
                  if (onTap != null) onTap();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: CustomColors.redText,
                      borderRadius: BorderRadius.circular(3.0)),
                  child: const Icon(
                    Icons.horizontal_rule,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              )),
        )
      ],
    );
  }

  Widget _uploadImage(CostListState state) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'images'.tr(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Roboto",
              ),
            ),
            _buttonUploadImages()
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        _imageRow(state)
      ],
    );
  }

  Widget _buttonUploadImages() {
    return GestureDetector(
      onTap: () {
        _onTapUploadImage();
      },
      child: Container(
        height: 35,
        width: 150,
        decoration: BoxDecoration(
            color: CustomColors.bluetext,
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.cloud_upload,
              color: Colors.white,
            ),
            Text(
              'uploadImages'.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Roboto",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageRow(CostListState state) {
    List<dynamic> imageList = state.getImages();

    return Row(
        children: List.generate(
            imageList.length, (index) => _image(imageList[index], index)));
  }

  Widget _image(image, int index) {
    return Expanded(
        child: image != null
            ? GestureDetector(
                onTap: () {
                  costListBloc.add(RemoveImageEvent(index: index));
                },
                child: Padding(
                  padding: EdgeInsets.only(right: index == 2 ? 5.0 : 0.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 80,
                        margin: const EdgeInsets.only(top: 6.0, right: 6.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: image.runtimeType == XFile
                                    ? Image.file(File((image as XFile).path))
                                        .image
                                    : Image.memory(image).image,
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(0.5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                    color: CustomColors.redText, width: 1.5)),
                            child: const Icon(
                              Icons.clear_rounded,
                              size: 11,
                              color: CustomColors.redText,
                            ),
                          )),
                    ],
                  ),
                ),
              )
            : Container());
  }

  _onTapUploadImage() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text('photoGallery'.tr()),
            onPressed: () async {
              Navigator.pop(context);
              List<XFile> images = await ImagePicker().pickMultiImage();
              costListBloc.add(UploadImagesEvent(files: images));
            },
          ),
          CupertinoActionSheetAction(
            child: Text('camera'.tr()),
            onPressed: () async {
              Navigator.pop(context);
              XFile? image =
                  await ImagePicker().pickImage(source: ImageSource.camera);
              List<XFile> listImages = [];
              if (image != null) listImages.add(image);
              costListBloc.add(UploadImagesEvent(files: listImages));
            },
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('cancel'.tr()),
        ),
      ),
    );
  }

  _submitButton({String title = 'submit', Function? onPress}) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) onPress();
      },
      child: Container(
        height: 35,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: CustomColors.bluetext,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          title.tr(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: "Roboto",
          ),
        ),
      ),
    );
  }

  _onSubmitSchedule() {
    costListBloc.add(UpdateCostListEvent(amountId: widget.amountId));
    context.pop();
  }
}
