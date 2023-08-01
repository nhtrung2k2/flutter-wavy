import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/service/getit/service_locator.dart';
import '../model/user_model.dart';
import 'dart:developer' as devtool;

import 'base_api.dart';

class AuthApi {
  final String baseUrl;
  late final BaseAPI baseApi;

  AuthApi()
      : baseUrl = "https://wavy-api.starboardasiavn.com",
        baseApi = BaseAPI();

  Future<void> setLanguage(String language) async {
    try {
      final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
      prefs.setString('language', language);
    } catch (e) {
      devtool.log(e.toString());
    }
  }

  Future<bool> getIsSavePassword() async {
    try {
      final securePrefs = ServiceLocator.locator.get<FlutterSecureStorage>();
      if (await securePrefs.containsKey(
          key: "password",
          aOptions: const AndroidOptions(encryptedSharedPreferences: true))) {
        final String? password = await securePrefs.read(
            key: 'password',
            aOptions: const AndroidOptions(encryptedSharedPreferences: true));
        if (password != null) {
          return true;
        }
      }
      return false;
    } catch (e) {
      devtool.log(e.toString());
      return false;
    }
  }

  Future<String> getPassword() async {
    try {
      final securePrefs = ServiceLocator.locator.get<FlutterSecureStorage>();
      if (await securePrefs.containsKey(
          key: "password",
          aOptions: const AndroidOptions(encryptedSharedPreferences: true))) {
        final String? password = await securePrefs.read(
            key: 'password',
            aOptions: const AndroidOptions(encryptedSharedPreferences: true));
        if (password != null) {
          return password;
        }
      }
      return '';
    } catch (e) {
      devtool.log(e.toString());
      return '';
    }
  }

  Future<String> getEmail() async {
    try {
      final securePrefs = ServiceLocator.locator.get<FlutterSecureStorage>();
      Map<String, String> allValues = await securePrefs.readAll();
      devtool.log(allValues.toString());
      if (await securePrefs.containsKey(
              key: "email",
              aOptions:
                  const AndroidOptions(encryptedSharedPreferences: true)) ==
          true) {
        final String? email = await securePrefs.read(
            key: 'email',
            aOptions: const AndroidOptions(encryptedSharedPreferences: true));

        if (email != null) {
          return email;
        }
      }
      return '';
    } catch (e) {
      devtool.log(e.toString());
      return '';
    }
  }

  Future<UserModel?> login(String email, String password, String language,
      bool isSavePassword) async {
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

        final user = UserModel.fromJson(data['user']);
        final prefs =
            await ServiceLocator.locator.getAsync<SharedPreferences>();
        final securePrefs = ServiceLocator.locator.get<FlutterSecureStorage>();

        prefs.setString('token', data['token']);
        prefs.setString('language', language);
        prefs.setString('userId', user.id);
        if (await securePrefs.read(key: 'email') != email) {
          await securePrefs.write(key: 'email', value: email);
        }
        if (isSavePassword) {
          if (await securePrefs.read(key: 'password') != password) {
            await securePrefs.write(key: 'password', value: password);
          }
        } else {
          if (await securePrefs.containsKey(key: 'password')) {
            await securePrefs.delete(key: 'password');
          }
        }
        return user;
      } else if (response.statusCode == 401) {
        throw "emailOrPasswordIsNotCorrect".tr();
      } else if (response.statusCode == 403) {
        throw "userIsInactivePleaseContactToAdmin".tr();
      }
    } catch (e) {
      rethrow;
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
