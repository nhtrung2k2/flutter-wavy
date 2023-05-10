import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'employee.g.dart';

@JsonSerializable()
class Employee extends Equatable {
  const Employee(
      {required this.id,
      required this.name,
      required this.age,
      required this.city,
      required this.avatar});
  final String id;
  final String name;
  final int age;
  @JsonKey(
      defaultValue:
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png")
  final String avatar;
  final String city;
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
  @override
  List<Object?> get props => [id, name, age, city, avatar];
}
