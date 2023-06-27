import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wavy/event/review_event.dart';
import 'package:wavy/model/employee_detail.dart';
import 'package:wavy/model/review.dart';
import 'package:wavy/repository/employees_repository.dart';
import 'package:wavy/repository/review_repository.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {

  final EmployeesRepository _employeesRepository;
  final ReviewRepository _reviewRepository = ServiceLocator.locator.get<ReviewRepository>();

  ReviewBloc(this._employeesRepository) : super(ReviewState.initial()) {
    on<InitDataEvent>(_onInitData);
    on<ChangeOverallRateEvent>(_onChangeRating);
    on<ChangeCommunicationRateEvent>(_onChangeRating);
    on<ChangeAttCleanRateEvent>(_onChangeRating);
    on<ChangeBabysittingRateEvent>(_onChangeRating);
    on<ChangeCookingRateEvent>(_onChangeRating);
    on<ChangeCleaningRateEvent>(_onChangeRating);
    on<ChangeLaundryRateEvent>(_onChangeRating);
    on<SwitchToogleEvent>(_onSwitchToggle);
    on<DisplayReviewEvent>(_onDisplayed);
    on<ResetValidate>(_onResetValidate);
    on<SubmitEvent>(_onSubmit);
  }

  Future<void> _onInitData(
      InitDataEvent event,
      Emitter<ReviewState> emit,
      ) async {

    emit(state.copyWith(
        review: const Review(),
        reviewStateStatus: ReviewStateStatus.initing,
        validateStatus: [],
        isBabysittingProvided: true,
        isCookingProvided: true,
        isLaundryProvided: true,
        isCleaningProvided: true,
    ));

    try {
      Employee_Detail employeeDetail = await _employeesRepository.fetchEmployDetail(event.babysistterId, event.shiftId);
      emit(state.copyWith(
          employee: employeeDetail,
          reviewStateStatus: ReviewStateStatus.inited
      ));
    } catch (e) {
      emit(state.copyWith(
          reviewStateStatus: ReviewStateStatus.initFailed
      ));
    }

  }

  Future<void> _onSwitchToggle(
      SwitchToogleEvent event,
      Emitter<ReviewState> emit,
      ) async {

    if(event.index==0){
      emit(state.copyWith(
        isBabysittingProvided: event.value
      ));
    }
    else if(event.index==1){
      emit(state.copyWith(
          isCookingProvided: event.value
      ));
    }
    else if(event.index==2){
      emit(state.copyWith(
          isLaundryProvided: event.value
      ));
    }
    else if(event.index==3){
      emit(state.copyWith(
          isCleaningProvided: event.value
      ));
    }

  }

  Future<void> _onDisplayed(
      DisplayReviewEvent event,
      Emitter<ReviewState> emit,
      ) async {

    emit(state.copyWith(
        review: state.review.copyWith(
            displayed: event.value ? 1 : 0
        )
    ));

  }

  Future<void> _onChangeRating(
      RateEvent event,
      Emitter<ReviewState> emit,
      ) async {

    if(event.runtimeType == ChangeOverallRateEvent){
      _onResetValidate(ResetValidate(status: ReviewValidateStatus.emptyOverallRatting), emit);
      emit(state.copyWith(
          review: state.review.copyWith(
              overallRating: event.rate
          )
      ));
    }
    else if(event.runtimeType == ChangeCommunicationRateEvent){
      _onResetValidate(ResetValidate(status: ReviewValidateStatus.emptyCommunicationRatting), emit);
      emit(state.copyWith(
          review: state.review.copyWith(
              communicationRating: event.rate
          )
      ));
    }
    else if(event.runtimeType == ChangeAttCleanRateEvent){
      _onResetValidate(ResetValidate(status: ReviewValidateStatus.emptyAttCleanRatting), emit);
      emit(state.copyWith(
          review: state.review.copyWith(
              attitudeCleanlinessRating: event.rate
          )
      ));
    }
    else if(event.runtimeType == ChangeBabysittingRateEvent){
      emit(state.copyWith(
          review: state.review.copyWith(
              babysittingRating: event.rate
          )
      ));
    }
    else if(event.runtimeType == ChangeCookingRateEvent){
      emit(state.copyWith(
          review: state.review.copyWith(
              cookingRating: event.rate
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

  }

  List<ReviewValidateStatus> validate(Review review) {

    List<ReviewValidateStatus> status = [];

    if(review.name==null || review.name!.trim().isEmpty) {
      status.add(ReviewValidateStatus.emptyName);
    }
    try{
      DateFormat('yyyy-MM-dd').parseStrict(review.dateStart ?? '');
    }
    catch(e){
      status.add(ReviewValidateStatus.startDateFormat);
    }
    try{
      DateFormat('yyyy-MM-dd').parseStrict(review.dateEnd ?? '');
    }
    catch(e){
      status.add(ReviewValidateStatus.endDateFormat);
    }
    if(review.overallComment.trim().isEmpty) {
      status.add(ReviewValidateStatus.emptyOverallComment);
    }
    if(review.overallRating==0) {
      status.add(ReviewValidateStatus.emptyOverallRatting);
    }
    if(review.communicationComment.trim().isEmpty) {
      status.add(ReviewValidateStatus.emptyCommunationComment);
    }
    if(review.communicationRating==0) {
      status.add(ReviewValidateStatus.emptyCommunicationRatting);
    }
    if(review.attitudeCleanliniessComment.trim().isEmpty) {
      status.add(ReviewValidateStatus.emptyAttCleanComment);
    }
    if(review.attitudeCleanlinessRating==0) {
      status.add(ReviewValidateStatus.emptyAttCleanRatting);
    }

    return status;
  }

  Future<void> _onResetValidate(
      ResetValidate event,
      Emitter<ReviewState> emit,
      ) async {

    List<ReviewValidateStatus> list = state.validateStatus;
    list.remove(event.status);

    emit(state.copyWith(
        reviewStateStatus: ReviewStateStatus.submitting,
        validateStatus: list
    ));

  }

  Future<void> _onSubmit(
      SubmitEvent event,
      Emitter<ReviewState> emit,
      ) async {

    emit(state.copyWith(
        reviewStateStatus: ReviewStateStatus.submitting,
        validateStatus: []
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

    List<ReviewValidateStatus> validateStatus = validate(review);
    if(validateStatus.isEmpty){
      try {
        Response response = await _reviewRepository.createReview(review.copyWith(
          dateStart: DateFormat('yyyy-MM-dd').format(DateFormat('yyyy-MM-dd').parse(review.dateStart!)),
          dateEnd: DateFormat('yyyy-MM-dd').format(DateFormat('yyyy-MM-dd').parse(review.dateEnd!)),
        ), event.babysistterId);
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
    else{
      emit(state.copyWith(
          validateStatus: validateStatus
      ));
    }

  }

}