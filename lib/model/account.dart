import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'account.g.dart';

@JsonSerializable()
class Account extends Equatable {
  const Account(
      {required this.email, required this.password, required this.language});
  final String email;
  final String password;
  final String language;
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  List<Object?> get props => [email, password, language];
}
