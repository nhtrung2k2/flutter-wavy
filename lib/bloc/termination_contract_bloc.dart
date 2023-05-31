import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/event/termination_contract_event.dart';
import 'package:wavy/model/employee_detail.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/repository/termination_contract_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/termination_contract_state.dart';

class TerminationContractBloc extends Bloc<TerminationContractEvent, TerminationContractState> {

  final EmployeesRepository _employeesRepository;
  final TerminationContractRepository _terminationContractRepository = ServiceLocator.locator.get<TerminationContractRepository>();

  TerminationContractBloc(this._employeesRepository) : super(TerminationContractState.initial()) {
    on<LoadingTerminationContractEvent>(_onLoading);
    on<ConfirmTerminationContractEvent>(_onConfirm);
  }

  Future<void> _onLoading(
      LoadingTerminationContractEvent event,
      Emitter<TerminationContractState> emit,
      ) async {

    emit(state.copyWith(
        terminationContractStatus: TerminationContractStatus.loading
    ));

    try {
      Employee_Detail employeeDetail = await _employeesRepository.fetchEmployDetail(event.babysistterId, event.shiftId);
      emit(state.copyWith(
          employee: employeeDetail,
          terminationContractStatus: TerminationContractStatus.confirming
      ));
    } catch (e) {
      emit(state.copyWith(
          terminationContractStatus: TerminationContractStatus.loadFailed
      ));
    }

  }

  Future<void> _onConfirm(
      ConfirmTerminationContractEvent event,
      Emitter<TerminationContractState> emit,
      ) async {

    emit(state.copyWith(
        terminationContractStatus: TerminationContractStatus.terminating
    ));

    try {
      Response response = await _terminationContractRepository.terminationContract(event.shiftId);
      if(response.statusCode==200){
        emit(state.copyWith(
            terminationContractStatus: TerminationContractStatus.terminated,
            messages: response.data['message']
        ));
      }
      else if(response.statusCode==404){
        emit(state.copyWith(
            terminationContractStatus: TerminationContractStatus.terminateFailed,
            messages: response.data['message']
        ));
        emit(state.copyWith(
            terminationContractStatus: TerminationContractStatus.confirming,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
          terminationContractStatus: TerminationContractStatus.terminateFailed,
          messages: {'message': 'This contract haven\'t paid so you can\'t end the contract'}
      ));
      emit(state.copyWith(
          terminationContractStatus: TerminationContractStatus.confirming,
      ));
    }


  }

}