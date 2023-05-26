import 'package:wavy/model/payment.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/service/payment_api.dart';

class PaymentRepository {
  final PaymentApi _paymentApi;
  PaymentRepository() : _paymentApi = ServiceLocator.locator.get<PaymentApi>();

  Future<Payment> fetchPaymentData(int shiftId, String ym) async {
    try {
      final paymentData = await _paymentApi.fetchPaymentData(shiftId: shiftId, ym: ym);

      return paymentData;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateItemPayment(Payment payment) async {
    try {
      await _paymentApi.updateItemPayment(payment: payment);
    } catch (e) {
      throw e.toString();
    }
  }

}
