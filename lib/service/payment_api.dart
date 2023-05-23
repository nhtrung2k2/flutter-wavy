import 'package:shared_preferences/shared_preferences.dart';
import 'package:wavy/model/payment.dart';
import 'package:wavy/service/base_api.dart';
import 'package:wavy/service/getit/service_locator.dart';

class PaymentApi {
  final String baseUrl;
  final BaseAPI baseAPI;
  PaymentApi()
      : baseUrl = "https://wavy-api.starboardasiavn.com",
        baseAPI = BaseAPI();
  Future<Payment> fetchPaymentData({
    required int shiftId,
    required String ym
  }) async {
    final url = '$baseUrl/api/payment';
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
        final paymentData = Payment.fromJson(data);
        return paymentData;
      } else {
        throw Exception("Can't get payment data");
      }
    } catch (e) {
      throw e.toString();
    }
  }

}
