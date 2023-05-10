library User;

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'package:wavy/model/user.freezed.dart';
part 'package:wavy/model/user.g.dart';

@freezed
abstract class User with _$User {
  const factory User(
      {required String id,
      required String name,
      required String role,
      @Default("https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png")
          String avatar}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

// User user = User(id:'s',name:'d',role:'1');
// final serialized=user.toJson();