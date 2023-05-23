import 'package:dio/dio.dart';
import 'package:wavy/model/review.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/service/review_api.dart';

class ReviewRepository {
  final ReviewApi _reviewApi;
  ReviewRepository() : _reviewApi = ServiceLocator.locator.get<ReviewApi>();

  Future<Response> createReview(Review review, String babysistterId) async {
    try {
      final response = await _reviewApi.createReview(review: review, babysistterId: babysistterId);

      return response;
    } catch (e) {
      throw e.toString();
    }
  }

}
