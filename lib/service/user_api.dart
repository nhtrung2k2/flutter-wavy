import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/service/getit/service_locator.dart';
import '../model/User.dart';
import 'dart:developer' as devtool;

import 'base_api.dart';

class UserApi {
  final String baseUrl;
  late final BaseAPI baseApi;
  UserApi()
      : baseUrl = "https://wavy-api.starboardasiavn.com",
        baseApi = BaseAPI();

  Future<User?> getUserInforSetting() async {
    final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
    final userInforStringFromPref = prefs.getString('userInfor');
    if (userInforStringFromPref != null) {
      final userJson = json.decode(userInforStringFromPref);
      final User user = User.fromJson(userJson);
      devtool.log(user.toString());
      return user;
    }
    return null;
  }
}
