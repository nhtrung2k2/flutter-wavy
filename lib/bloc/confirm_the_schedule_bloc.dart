import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wavy/event/confirm_schedule_event.dart';
import 'package:wavy/model/employee_detail.dart';
import 'package:wavy/model/schedule_confirm.dart';
import 'package:wavy/repository/confirm_the_schedule_repository.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/confirm_the_schedule_state.dart';

class ConfirmTheScheduleBloc
    extends Bloc<ConfirmScheduleEvent, ConfirmTheScheduleState> {
  final EmployeesRepository _employeesRepository;
  final ConfirmTheScheduleRepository _confirmTheScheduleRepository =
      ServiceLocator.locator.get<ConfirmTheScheduleRepository>();

  ConfirmTheScheduleBloc(this._employeesRepository)
      : super(ConfirmTheScheduleState.initial()) {
    on<LoadDataConfirmScheduleEvent>(_onLoadData);
    on<NextMonthEvent>(_onNextMonth);
    on<PrevMonthEvent>(_onPrevMonth);
    on<CheckItemEvent>(_onCheckItem);
  }

  Future<void> _onLoadData(
    LoadDataConfirmScheduleEvent event,
    Emitter<ConfirmTheScheduleState> emit,
  ) async {
    emit(state.copyWith(
        month: DateTime.now().month,
        year: DateTime.now().year,
        informationStatus: InformationStatus.loading,
        monthScheduleStatus: MonthScheduleStatus.loading));

    try {
      Employee_Detail employeeDetail = await _employeesRepository
          .fetchEmployDetail(event.babysisterId, null);
      List<ScheduleConfirm> scheduleConfirms =
          await _confirmTheScheduleRepository.fetchScheduleConfirm(
              event.shiftId,
              DateFormat('yyyy-MM').format(DateTime(state.year, state.month)));
      emit(state.copyWith(
          employee: employeeDetail,
          scheduleConfirms: scheduleConfirms,
          informationStatus: InformationStatus.success,
          monthScheduleStatus: MonthScheduleStatus.success));
    } catch (e) {
      emit(state.copyWith(
          informationStatus: InformationStatus.failure,
          monthScheduleStatus: MonthScheduleStatus.failure));
    }
  }

  Future<void> _onNextMonth(
    NextMonthEvent event,
    Emitter<ConfirmTheScheduleState> emit,
  ) async {
    emit(state.nextMonth());

    try {
      List<ScheduleConfirm> scheduleConfirms =
          await _confirmTheScheduleRepository.fetchScheduleConfirm(
              event.shiftId,
              DateFormat('yyyy-MM').format(DateTime(state.year, state.month)));
      emit(state.copyWith(
          scheduleConfirms: scheduleConfirms,
          monthScheduleStatus: MonthScheduleStatus.success));
    } catch (_) {
      emit(state.copyWith(monthScheduleStatus: MonthScheduleStatus.failure));
    }
  }

  Future<void> _onPrevMonth(
    PrevMonthEvent event,
    Emitter<ConfirmTheScheduleState> emit,
  ) async {
    emit(state.prevMonth());

    try {
      List<ScheduleConfirm> scheduleConfirms =
          await _confirmTheScheduleRepository.fetchScheduleConfirm(
              event.shiftId,
              DateFormat('yyyy-MM').format(DateTime(state.year, state.month)));
      emit(state.copyWith(
          scheduleConfirms: scheduleConfirms,
          monthScheduleStatus: MonthScheduleStatus.success));
    } catch (_) {
      emit(state.copyWith(monthScheduleStatus: MonthScheduleStatus.failure));
    }
  }

  Future<void> _onCheckItem(
    CheckItemEvent event,
    Emitter<ConfirmTheScheduleState> emit,
  ) async {
    String message =
        await _confirmTheScheduleRepository.updateConfirmFlag(event.amountId);

    List<ScheduleConfirm> confirms = [];
    for (ScheduleConfirm s in state.scheduleConfirms) {
      if (s.amountId == event.amountId) {
        confirms.add(s.copyWith(confirmFlag: event.value ? 1 : 0));
      } else {
        confirms.add(s);
      }
    }

    emit(state.copyWith(scheduleConfirms: confirms));
  }
}
