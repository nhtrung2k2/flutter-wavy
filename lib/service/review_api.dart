import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/model/review.dart';
import 'package:wavy/service/base_api.dart';
import 'package:wavy/service/getit/service_locator.dart';

class ReviewApi {
  final String baseUrl;
  final BaseAPI baseAPI;
  ReviewApi()
      : baseUrl = "https://wavy-api.starboardasiavn.com",
        baseAPI = BaseAPI();

  Future<Response> createReview({
    required Review review,
    required String babysistterId
  }) async {
    final url = '$baseUrl/api/create_review';
    try {
      final prefs = await ServiceLocator.locator.getAsync<SharedPreferences>();
      final token = prefs.getString('token');
      final language = prefs.getString('language');
      final userId = prefs.getString('userId');

      Map<String, dynamic> body = review.toJson();
      body['user_id'] = userId;
      body['babysistter_id'] = babysistterId;

      final response =
      await baseAPI.post(
          url,
          body,
          {'Authorization': 'Bearer $token', 'X-Localization': language}
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception("Can't create a review");
      }
    } catch (e) {
      throw e.toString();
    }
  }

}
