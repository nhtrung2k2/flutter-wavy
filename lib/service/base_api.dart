import 'package:dio/dio.dart';

import 'getit/service_locator.dart';

class BaseAPI {
  BaseAPI() {
    // Set up default headers
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
  }

  // Helper method to set an authorization token
  void setAuthorizationToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  final dio = ServiceLocator.locator.get<Dio>();
  // Helper method to make a GET request
  Future<Response> get(String url, String? token) async {
    try {
      if (token != null) {
        setAuthorizationToken(token);
      }
      return await dio.get(url);
    } catch (e) {
      throw Exception('Failed to make GET request: ${e.toString()}');
    }
  }

  // Helper method to make a POST request
  Future<Response> post(
      String url, Map<String, dynamic> data, String? token) async {
    try {
      if (token != null) {
        setAuthorizationToken(token);
      }

      return await dio.post(url, data: data);
    } catch (e) {
      throw Exception('Failed to make POST request: ${e.toString()}');
    }
  }

  // Helper method to make a PUT request
  Future<Response> put(String url, Map<String, dynamic> data) async {
    try {
      return await dio.put(url, data: data);
    } catch (e) {
      throw Exception('Failed to make PUT request: ${e.toString()}');
    }
  }

  // Helper method to make a DELETE request
  Future<Response> delete(String url) async {
    try {
      return await dio.delete(url);
    } catch (e) {
      throw Exception('Failed to make DELETE request: ${e.toString()}');
    }
  }
}