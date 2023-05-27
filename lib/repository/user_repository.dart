import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:wavy/service/auth_api.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/service/user_api.dart';

import '../model/User.dart';

class UserRepository {
  final AuthApi _authApi;
  final UserApi _userApi;
  UserRepository()
      : _authApi = ServiceLocator.locator.get<AuthApi>(),
        _userApi = ServiceLocator.locator.get<UserApi>();
  Future<User?> login(String email, String password, String language) async {
    try {
      final user = await _authApi.login(email, password, language);

      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String?> getUserId() async {
    return _authApi.getUserId();
  }

  Future<User?> getUserInforSetting() async {
    return await _userApi.getUserInforSetting();
  }
}
