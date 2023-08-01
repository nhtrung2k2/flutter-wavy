import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class CostListEvent {}

enum Time { start, end }

class OnChangeTime extends CostListEvent {
  final Time time;
  final TimeOfDay? value;
  OnChangeTime({required this.time, required this.value});
}

class FetchCostListDataEvent extends CostListEvent {
  final int amountId;
  FetchCostListDataEvent({required this.amountId});
}

class UploadImagesEvent extends CostListEvent {
  final List<XFile> files;
  UploadImagesEvent({required this.files});
}

class RemoveImageEvent extends CostListEvent {
  final int index;
  RemoveImageEvent({required this.index});
}

class UpdateCostListEvent extends CostListEvent {
  final int amountId;
  UpdateCostListEvent({required this.amountId});
}

class AddNewItemEvent extends CostListEvent {
  final int itemId;
  AddNewItemEvent({required this.itemId});
}

class ChangePriceItemEvent extends CostListEvent {
  final int price;
  final int index;
  ChangePriceItemEvent({required this.index, required this.price});
}

class RemoveItemEvent extends CostListEvent {
  final int index;
  RemoveItemEvent({required this.index});
}
