import 'package:bloc/bloc.dart';
import 'package:wavy/bloc/employee_search_bloc.dart';
import 'package:wavy/repository/employees_repository.dart';

import '../event/employee_detail_event.dart';
import '../state/employee_detail_state.dart';

class EmployeeDetailBloc
    extends Bloc<EmployeeDetailEvent, EmployeeDetailState> {
  final EmployeesRepository employeeRepo;
  EmployeeDetailBloc(this.employeeRepo)
      : super(const InitialEmployeeDetailState()) {
    on<OnSubmmited>(_onSubmitted);
  }
  Future<void> _onSubmitted(
      OnSubmmited event, Emitter<EmployeeDetailState> emit) async {
    emit(const SubmittedEmployeeDetailLoadingState());
    try {
      final employee = await employeeRepo.fetchEmployDetail(
          event.babysisterDetailId, event.shiftId);
      emit(SubmittedEmployeeDetailSuccessState(employeeDetail: employee, shiftId: event.shiftId));
    } catch (e) {
      emit(SubmittedEmployeeDetailErrorState(errorMessage: e.toString()));
    }
  }
}
