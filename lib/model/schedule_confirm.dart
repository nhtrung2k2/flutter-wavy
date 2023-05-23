
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_confirm.freezed.dart';
part 'schedule_confirm.g.dart';

@freezed
abstract class ScheduleConfirm with _$ScheduleConfirm {
  const factory ScheduleConfirm({
      @JsonKey(name: 'amount_id')
      required String amountId,
      @JsonKey(name: 'amount_date')
      required String amountDate,
      @JsonKey(name: 'working_time')
      required String workingTime,
      @JsonKey(name: 'amount')
      required int amount,
      @JsonKey(name: 'confirm_flag')
      required int confirmFlag,
      @JsonKey(name: 'payment_status')
      required int paymentStatus
  }) = _ScheduleConfirm;

  factory ScheduleConfirm.fromJson(Map<String, dynamic> json) => _$ScheduleConfirmFromJson(json);
}