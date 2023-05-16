import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_detail.freezed.dart';
part 'employee_detail.g.dart';

@freezed
abstract class Employee_Detail with _$Employee_Detail {
  const factory Employee_Detail(
      {@JsonKey(name: 'babysistter_id')
          required String id,
      @JsonKey(name: 'name')
          required String name,
      @JsonKey(name: 'email')
          required String email,
      @JsonKey(name: 'cancel_contract_date')
          DateTime? cancel__contract_date,
      @Default("https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png")
          String avatar}) = _Employee_Detail;
  factory Employee_Detail.fromJson(Map<String, dynamic> json) =>
      _$Employee_DetailFromJson(json);
}
