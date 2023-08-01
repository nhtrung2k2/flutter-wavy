import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/model/cost.dart';
import 'package:wavy/service/base_api.dart';
import 'package:wavy/service/getit/service_locator.dart';

import 'dart:convert';

class CostListApi {
  final String baseUrl;
  final BaseAPI baseAPI;
  CostListApi()
      : baseUrl = "https://wavy-api.starboardasiavn.com",
        baseAPI = BaseAPI();
  Future<Cost> fetchCostList({required int amountId}) async {
    final url = '$baseUrl/api/cost_list/$amountId';
    try {
      final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
      final token = prefs.getString('token');
      final language = prefs.getString('language');

      final response = await baseAPI.get(
          url, {'Authorization': 'Bearer $token', 'X-Localization': language});

      if (response.statusCode == 200) {
        final data = response.data;
        final cost = Cost.fromJson(data);
        return cost;
      } else {
        throw Exception("Can't get cost");
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> updateCostList({
    required int amountId,
    required Cost cost,
  }) async {
    final url = '$baseUrl/api/update_cost';
    try {
      final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
      final token = prefs.getString('token');
      final language = prefs.getString('language');

      var bodyData = cost.toJson();
      bodyData['amount_id'] = amountId;

      final response = await baseAPI.post(url, bodyData,
          {'Authorization': 'Bearer $token', 'X-Localization': language});

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Can't update cost");
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
