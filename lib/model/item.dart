import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

const List<Map<String, dynamic>> itemCost = [
  {'id': 1, 'name': 'transportation'},
  {'id': 2, 'name': 'parking'},
  {'id': 3, 'name': 'meal'},
  {'id': 4, 'name': 'other'},
  {'id': 5, 'name': 'overtime'},
  {'id': 6, 'name': 'grocery'},
  {'id': 7, 'name': 'otherPaidCost'},
  {'id': 8, 'name': 'other'},
  {'id': 9, 'name': 'tetBonus'},
  {'id': 10, 'name': 'contractEndBonus'},
  {'id': 11, 'name': 'other'}
];

const List<Map<String, dynamic>> itemOption = [
  {'id': 1, 'name': 'oncePerDay'},
  {'id': 2, 'name': 'oncePerMonth'}
];

@freezed
abstract class Item with _$Item {
  const factory Item({
    @JsonKey(name: 'item_id') required int itemId,
    @JsonKey(name: 'item_name') @Default('') String itemName,
    @JsonKey(name: 'item_amount') required int itemAmount,
    @JsonKey(name: 'option') @Default(1) int option,
    @JsonKey(name: 'include_in_payment', nullable: true) int? includeInPayment,
    @Default(true) bool canRemove,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
