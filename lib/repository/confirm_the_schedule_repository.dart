
import 'package:wavy/model/schedule_confirm.dart';
import 'package:wavy/service/confirm_schedule_api.dart';
import 'package:wavy/service/getit/service_locator.dart';

class ConfirmTheScheduleRepository {
  final ScheduleConfirmApi _scheduleConfirmApi;
  ConfirmTheScheduleRepository() : _scheduleConfirmApi = ServiceLocator.locator.get<ScheduleConfirmApi>();
  Future<List<ScheduleConfirm>> fetchScheduleConfirm(int shiftId, String ym) async {
    try {
      final scheudleConfirms = await _scheduleConfirmApi.fetchScheduleConfirm(shiftId: shiftId, ym: ym);

      return scheudleConfirms;
    } catch (e) {
      throw e.toString();
    }
  }
}
