import 'package:dio/dio.dart';
import 'package:wavy/service/getit/service_locator.dart';

import '../model/User.dart';

import 'dart:convert';

class AuthApi {
  late final Dio _dio;
  final String baseUrl;

  AuthApi()
      : _dio = ServiceLocator.locator.get<Dio>(),
        baseUrl = "https://wavy-api.starboardasiavn.com";

  Future<User?> login(String email, String password, String language) async {
    var loginUrl = '$baseUrl/api/login';
    try {
      final response = await _dio.post(loginUrl, data: {
        'email': email,
        'password': password,
        'language': language,
      });
      if (response.statusCode == 200) {
        final data = response.data;
        final jsonMap = json.decode(data);
        final user = User.fromJson(jsonMap);
        return user;
      } else if (response.statusCode == 404) {
        throw Exception("Cannot find username or password");
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
