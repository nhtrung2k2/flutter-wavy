
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

const List<Map<String, dynamic>> itemCost = [
  {'id': 1, 'name': 'Transportation'},
  {'id': 2, 'name': 'Parking'},
  {'id': 3, 'name': 'Meal'},
  {'id': 4, 'name': 'Other'},
  {'id': 5, 'name': 'Grocery'},
  {'id': 6, 'name': 'Other paid cost'},
  {'id': 7, 'name': 'Overtime'},
  {'id': 8, 'name': 'Other'},
  {'id': 9, 'name': 'Tet bonus'},
  {'id': 10, 'name': 'Contract-end bonus'},
  {'id': 11, 'name': 'Other'}
];

const List<Map<String, dynamic>> itemOption = [
  {'id': 1, 'name': 'Once a month'},
  {'id': 2, 'name': 'Once per worked day'}
];

@freezed
abstract class Item with _$Item {
  const factory Item({
    @JsonKey(name: 'item_id')
    required int itemId,
    @JsonKey(name: 'item_name')
    @Default('')
    String itemName,
    @JsonKey(name: 'item_amount')
    required int itemAmount,
    @JsonKey(name: 'option')
    @Default(1)
    int option,
    @JsonKey(name: 'include_in_payment', nullable: true)
    int? includeInPayment,
    @Default(true)
    bool canRemove,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

}