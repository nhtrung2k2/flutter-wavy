import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/service/getit/service_locator.dart';
import '../model/User.dart';
import 'dart:developer' as devtool;

import 'base_api.dart';

class AuthApi {
  final String baseUrl;
  late final BaseAPI baseApi;
  AuthApi()
      : baseUrl = "https://wavy-api.starboardasiavn.com",
        baseApi = BaseAPI();

  Future<User?> login(String email, String password, String language) async {
    final loginUrl = '$baseUrl/api/login';
    try {
      final response = await baseApi.post(loginUrl, {
        'email': email,
        'password': password,
      }, {
        'X-Localization': language,
      });
      if (response.statusCode == 200) {
        final data = response.data;

        final user = User.fromJson(data['user']);
        final prefs =
            await ServiceLocator.locator.getAsync<SharedPreferences>();

        prefs.setString('token', data['token']);
        prefs.setString('language', language);
        prefs.setString('userId', user.id);
        return user;
      } else if (response.statusCode == 401) {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      // devtool.log(e.toString());
      throw e.toString();
    }
  }

  Future<String?> getUserId() async {
    final sharedPreferences = ServiceLocator.locator.get<SharedPreferences>();
    final jsonString = sharedPreferences.getString("userId");
    if (jsonString != null) {
      final String userId = jsonDecode(jsonString);
      return userId;
    }
    return null;
  }

  Future<void> logout() async {
    final logoutUrl = '$baseUrl/api/logout';
    try {
      final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
      final token = prefs.getString("token");
      final language = prefs.getString("language");
      final response = await baseApi.post(logoutUrl, null,
          {'Authorization': 'Bearer $token', 'X-Localization': '$language'});
      if (response.statusCode == 200) {
        prefs.setString("token", "");
        prefs.setString("language", "");
        prefs.setString('userId', "");
      } else if (response.statusCode == 400) {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      // devtool.log(e.toString());
      throw e.toString();
    }
  }
}
