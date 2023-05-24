import 'package:image_picker/image_picker.dart';

abstract class CostListEvent {}

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

class AddItemEvent extends CostListEvent {
  final int itemId;
  final int price;
  final int optionId;
  AddItemEvent({required this.itemId, required this.price, required this.optionId});
}

class RemoveItemEvent extends CostListEvent {
  final int index;
  RemoveItemEvent({required this.index});
}