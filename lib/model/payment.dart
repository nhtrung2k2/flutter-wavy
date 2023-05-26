
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wavy/model/item.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
abstract class Payment with _$Payment {
  const factory Payment({
      @JsonKey(name: 'payment_id')
      required int paymentId,
      @JsonKey(name: 'payment_month')
      required String paymentMonth,
      @JsonKey(name: 'labour_cost')
      required int labourCost,
      @JsonKey(name: 'hour_working')
      required int hourWorking,
      @JsonKey(name: 'hourly_wage')
      required int hourlyWage,
      @JsonKey(name: 'payment_amount')
      required int paymentAmount,
      @JsonKey(name: 'payment_status')
      required int paymentStatus,
      @JsonKey(name: 'items')
      required List<Item> items,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);
}