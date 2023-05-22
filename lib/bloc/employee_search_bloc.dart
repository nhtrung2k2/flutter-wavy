import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/event/search_event.dart';
import 'package:wavy/service/getit/service_locator.dart';

import '../repository/employees_repository.dart';
import '../state/employee_search_state.dart';

class EmployeeSearchBloc extends Bloc<SearchEvent, SearchState> {
  final EmployeesRepository employeeRepo;
  EmployeeSearchBloc(this.employeeRepo) : super(const InitialState()) {
    on<OnChangedValue>(_onValueChanged);
    on<OnSubmmited>(_onSubmitted);
  }
  void _onValueChanged(OnChangedValue event, Emitter<SearchState> emit) {
    emit(ChangedState(value: event.value));
  }

  Future<void> _onSubmitted(
      OnSubmmited event, Emitter<SearchState> emit) async {
    emit(const ChangedLoading(isLoading: true));
    try {
      final employee = await employeeRepo.fetchEmployDetail(event.value);
      emit(const ChangedLoading(isLoading: false));
      emit(SubmittedSuccess(employeeDetail: employee));
    } catch (e) {
      emit(const ChangedLoading(isLoading: false));
      emit(SubmittedError(errorMessage: e.toString()));
    }
  }
}
