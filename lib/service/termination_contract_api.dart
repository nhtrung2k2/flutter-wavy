import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/service/base_api.dart';
import 'package:wavy/service/getit/service_locator.dart';

class TerminationContractApi {
  final String baseUrl;
  final BaseAPI baseAPI;
  TerminationContractApi()
      : baseUrl = "https://wavy-api.starboardasiavn.com",
        baseAPI = BaseAPI();

  Future<Response> terminationContract({
    required int shiftId
  }) async {
    final url = '$baseUrl/api/termination_contract/$shiftId';
    try {
      final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
      final token = prefs.getString('token');
      final language = prefs.getString('language');

      final response =
      await baseAPI.post(
          url,
          {"shift_id": shiftId},
          {'Authorization': 'Bearer $token', 'X-Localization': language}
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Can't terminate contract");
      }
    } catch (e) {
      throw e.toString();
    }
  }

}
