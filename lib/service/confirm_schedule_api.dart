import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/model/schedule_confirm.dart';
import 'package:wavy/service/base_api.dart';
import 'package:wavy/service/getit/service_locator.dart';

import 'dart:convert';

class ScheduleConfirmApi {
  final String baseUrl;
  final BaseAPI baseAPI;
  ScheduleConfirmApi()
      : baseUrl = "https://wavy-api.starboardasiavn.com",
        baseAPI = BaseAPI();
  Future<List<ScheduleConfirm>> fetchScheduleConfirm({
    required int shiftId,
    required String ym
  }) async {
    final url = '$baseUrl/api/confirm_schedule';
    try {
      final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
      final token = prefs.getString('token');
      final language = prefs.getString('language');

      final response =
      await baseAPI.post(
          url,
          {
            'shift_id': shiftId,
            'ym': ym
          },
          {'Authorization': 'Bearer $token', 'X-Localization': language}
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final confirmScheudles = data.map((json) => ScheduleConfirm.fromJson(json)).toList();
        return confirmScheudles;
      } else {
        throw Exception("Can't get confirm schedule");
      }
    } catch (e) {
      throw e.toString();
    }
  }

}
