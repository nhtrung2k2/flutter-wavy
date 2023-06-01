import 'dart:convert';

import 'package:dio/dio.dart';

import 'getit/service_locator.dart';
import 'dart:developer' as devtool;

class BaseAPI {
  BaseAPI() {
    // Set up default headers
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
  }

  final dio = ServiceLocator.locator.get<Dio>();
  // Helper method to make a GET request
  Future<Response> get(String url, Map<String, dynamic>? headers) async {
    try {
      if (headers != null) {
        dio.options.headers.addAll(headers);
      }

      return await dio.get(url);
    } catch (e) {
      throw Exception('Failed to make GET request: ${e.toString()}');
    }
  }

  // Helper method to make a POST request
  Future<Response> post(String url, Map<String, dynamic>? data,
      Map<String, dynamic>? headers) async {
    try {
      if (headers != null) {
        dio.options.headers.addAll(headers);
      }
      dio.options.validateStatus = (statusCode) {
        if (statusCode == 422) {
          return true;
        }
        if (statusCode == 200) {
          return true;
        }
        if (statusCode == 401) {
          return true;
        }
        return false;
      };
      // data!.forEach((key, value) {
      //   devtool.log(key);
      //   try {
      //     String jsonString = jsonEncode(value);
      //     devtool.log(jsonString);
      //   } catch (e) {
      //     devtool.log(value);
      //   }
      // });
      devtool.log("dio");
      devtool.log(dio.toString());
      final response = await dio.post(url, data: data);
      return response;
    } catch (error) {
      if (error is DioError && error.type == DioErrorType.badResponse) {
        // Handle DioError.badResponse error

        throw Exception('Failed to make POST request: ${error.toString()}');
      } else {
        // Handle other types of errors
        throw Exception('Failed to make POST request: ${error.toString()}');
      }
    }
  }

  // Helper method to make a PUT request
  Future<Response> put(String url, Map<String, dynamic> data,
      Map<String, dynamic>? headers) async {
    try {
      if (headers != null) {
        dio.options.headers.addAll(headers);
      }
      return await dio.put(url, data: data);
    } catch (e) {
      throw Exception('Failed to make PUT request: ${e.toString()}');
    }
  }

  // Helper method to make a DELETE request
  Future<Response> delete(String url, Map<String, dynamic>? headers) async {
    try {
      if (headers != null) {
        dio.options.headers.addAll(headers);
      }
      return await dio.delete(url);
    } catch (e) {
      throw Exception('Failed to make DELETE request: ${e.toString()}');
    }
  }
}
