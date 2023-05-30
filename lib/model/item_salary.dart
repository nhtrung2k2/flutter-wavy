import 'package:freezed_annotation/freezed_annotation.dart';
part 'item_salary.freezed.dart';
part 'item_salary.g.dart';

@freezed
abstract class ItemSalary with _$ItemSalary {
  const factory ItemSalary({
    @JsonKey(name: 'item_type_id') required int id,
    @JsonKey(name: 'price') required int price,
    @JsonKey(name: 'option') required int option,
  }) = _ItemSalary;
  factory ItemSalary.fromJson(Map<String, dynamic> json) =>
      _$ItemSalaryFromJson(json);
}
