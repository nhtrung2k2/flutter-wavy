import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/model/user_model.dart';
import 'package:wavy/service/getit/service_locator.dart';

import 'dart:developer' as devtool;

import 'base_api.dart';

class UserApi {
  final String baseUrl;
  late final BaseAPI baseApi;
  UserApi()
      : baseUrl = "https://wavy-api.starboardasiavn.com",
        baseApi = BaseAPI();

  Future<UserModel?> getUserInforSetting() async {
    final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
    final userInforStringFromPref = prefs.getString('userInfor');
    if (userInforStringFromPref != null) {
      final userJson = json.decode(userInforStringFromPref);
      final UserModel user = UserModel.fromJson(userJson);
      devtool.log(user.toString());
      return user;
    }
    return null;
  }

  Future<void> cancelMembership() async {
    final cancelUrl = '$baseUrl/api/cancel_membership';
    try {
      final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
      final token = prefs.getString("token");
      final language = prefs.getString("language");
      final userId = prefs.getString('userId');
      final data = {'user_id': userId};
      if (userId != null) {
        final response = await baseApi.post(cancelUrl, data,
            {'Authorization': 'Bearer $token', 'X-Localization': '$language'});
        if (response.statusCode == 200) {
          return;
        } else if (response.statusCode == 400) {
          throw "Token could not be parsed from the request.";
        } else if (response.statusCode == 404) {
          throw response.data["message"];
        }
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
