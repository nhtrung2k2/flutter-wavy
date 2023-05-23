import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/event/review_event.dart';
import 'package:wavy/model/employee.dart';
import 'package:wavy/model/review.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/repository/review_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {

  final EmployeesRepository _employeesRepository = ServiceLocator.locator.get<EmployeesRepository>();
  final ReviewRepository _reviewRepository = ServiceLocator.locator.get<ReviewRepository>();

  ReviewBloc() : super(ReviewState.initial()) {
    on<InitDataEvent>(_onInitData);
    on<ChangeOverallRateEvent>(_onChangeRating);
    on<ChangeCleaningRateEvent>(_onChangeRating);
    on<ChangeLaundryRateEvent>(_onChangeRating);
    on<ChangePetcareRateEvent>(_onChangeRating);
    on<ChangeShoppingRateEvent>(_onChangeRating);
    on<SubmitEvent>(_onSubmit);
  }

  Future<void> _onInitData(
    InitDataEvent event,
    Emitter<ReviewState> emit,
  ) async {

    emit(state);

    try {
      // Employee_Detail employee_detail = await _employeesRepository.fetchEmployDetail(event.babysistterId);
      emit(state.copyWith(
        employee: Employee(id: '1', name: 'Test Babysister', age: '30', city: 'Ho Chi Minh', shiftId: 1),
        reviewStateStatus: ReviewStateStatus.inited
      ));
    } catch (e) {
      emit(state.copyWith(
        reviewStateStatus: ReviewStateStatus.initFailed
      ));
    }

  }

  Future<void> _onChangeRating(
      RateEvent event,
      Emitter<ReviewState> emit,
      ) async {

    if(event.runtimeType == ChangeOverallRateEvent){
      emit(state.copyWith(
          review: state.review.copyWith(
              overallRating: event.rate
          )
      ));
    }
    else if(event.runtimeType == ChangeCleaningRateEvent){
      emit(state.copyWith(
          review: state.review.copyWith(
              cleanningRating: event.rate
          )
      ));
    }
    else if(event.runtimeType == ChangeLaundryRateEvent){
      emit(state.copyWith(
          review: state.review.copyWith(
              laundryRating: event.rate
          )
      ));
    }
    else if(event.runtimeType == ChangePetcareRateEvent){
      emit(state.copyWith(
          review: state.review.copyWith(
              babysittingRating: event.rate
          )
      ));
    }
    else if(event.runtimeType == ChangeShoppingRateEvent){
      emit(state.copyWith(
          review: state.review.copyWith(
              communicationRating: event.rate
          )
      ));
    }

  }

  Future<void> _onSubmit(
      SubmitEvent event,
      Emitter<ReviewState> emit,
      ) async {

    emit(state.copyWith(
        reviewStateStatus: ReviewStateStatus.submitting
    ));

    Review review = state.review.copyWith(
      name: event.name,
      dateEnd: event.dateEnd,
      dateStart: event.dateStart,
      overallComment: event.overallComment,
      babysittingComment: event.babysisttingComment,
      cookingComment: event.cookingComment,
      cleaningComment: event.cleanningComment,
      launryComment: event.laundryComment,
      attitudeCleanliniessComment: event.attitudeCleanlinessComment,
      communicationComment: event.communicationComment
    );

    try {
      Response response = await _reviewRepository.createReview(review, event.babysistterId);
      if(response.statusCode==200){
        emit(state.copyWith(
            reviewStateStatus: ReviewStateStatus.submitted
        ));
      }
      else{
        emit(state.copyWith(
            reviewStateStatus: ReviewStateStatus.cannotSubmit
        ));
      }
    } catch (e) {
      emit(state.copyWith(
          reviewStateStatus: ReviewStateStatus.cannotSubmit
      ));
    }

  }

}