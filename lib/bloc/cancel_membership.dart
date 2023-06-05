import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/event/cancel_membership_event.dart';

import 'package:wavy/repository/user_repository.dart';
import 'package:wavy/state/cancel_membership_state.dart';

import 'package:wavy/state/logout_state.dart';

import '../event/logout_event.dart';

import 'dart:developer' as devtool;

class CancelMemberShipBloc
    extends Bloc<CancelMembershipEvent, CancelMembershipState> {
  final UserRepository userRepo;
  CancelMemberShipBloc(this.userRepo) : super(const CancelMembershipInit()) {
    on<CancelMembershipPressed>(_onSubmitted);
    on<CancelMembershipConfirmEvent>(_onConfirm);
  }
  void _onConfirm(
      CancelMembershipConfirmEvent event, Emitter<CancelMembershipState> emit) {
    emit(const CancelMembershipConfirmStateSuccess());
  }

  Future<void> _onSubmitted(CancelMembershipPressed event,
      Emitter<CancelMembershipState> emit) async {
    emit(const CancelMembershipStateLoading());
    try {
      await userRepo.cancelMembership();
      emit(const CancelMembershipStateSuccess());
    } catch (e) {
      emit(CancelMembershipStateFail(e.toString()));
    }
  }
}
