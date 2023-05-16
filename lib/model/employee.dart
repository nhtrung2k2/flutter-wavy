import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
abstract class Employee with _$Employee {
  const factory Employee(
      {@JsonKey(name: 'babysistter_id')
          required String id,
      @JsonKey(name: 'name')
          required String name,
      @JsonKey(name: 'age')
          required String age,
      @JsonKey(name: 'city')
          required String city,
      @JsonKey(name: 'shift_id')
          required int shiftId,
      @JsonKey(name: 'cancel_contract_date')
          DateTime? cancel__contract_date,
      @Default("https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png")
          String avatar}) = _Employee;
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}
