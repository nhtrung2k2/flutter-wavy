import 'package:wavy/state/review_state.dart';

abstract class ReviewEvent {}

class InitDataEvent extends ReviewEvent {
  final String babysistterId;
  final int shiftId;
  InitDataEvent({required this.babysistterId, required this.shiftId});
}

class ResetValidate extends ReviewEvent {
  final ReviewValidateStatus status;
  ResetValidate({required this.status});
}

abstract class RateEvent extends ReviewEvent {
  final int rate;
  RateEvent({required this.rate});
}

class ChangeOverallRateEvent extends RateEvent {
  ChangeOverallRateEvent({required rate}) : super(rate: rate);
}

class ChangeCommunicationRateEvent extends RateEvent {
  ChangeCommunicationRateEvent({required rate}) : super(rate: rate);
}

class ChangeAttCleanRateEvent extends RateEvent {
  ChangeAttCleanRateEvent({required rate}) : super(rate: rate);
}

class ChangeBabysittingRateEvent extends RateEvent {
  ChangeBabysittingRateEvent({required rate}) : super(rate: rate);
}

class ChangeCookingRateEvent extends RateEvent {
  ChangeCookingRateEvent({required rate}) : super(rate: rate);
}

class ChangeCleaningRateEvent extends RateEvent {
  ChangeCleaningRateEvent({required rate}) : super(rate: rate);
}

class ChangeLaundryRateEvent extends RateEvent {
  ChangeLaundryRateEvent({required rate}) : super(rate: rate);
}

class ChangePetcareRateEvent extends RateEvent {
  ChangePetcareRateEvent({required rate}) : super(rate: rate);
}

class ChangeShoppingRateEvent extends RateEvent {
  ChangeShoppingRateEvent({required rate}) : super(rate: rate);
}

class SwitchToogleEvent extends ReviewEvent {
  final int index;
  final bool value;
  SwitchToogleEvent({required this.index, required this.value});
}

class DisplayReviewEvent extends ReviewEvent {
  final bool value;
  DisplayReviewEvent({required this.value});
}

class SubmitEvent extends ReviewEvent {
  final String babysistterId;
  final String name;
  final String dateStart;
  final String dateEnd;
  final String overallComment;
  final String babysisttingComment;
  final String cookingComment;
  final String cleanningComment;
  final String laundryComment;
  final String attitudeCleanlinessComment;
  final String communicationComment;
  SubmitEvent({
    required this.babysistterId,
    required this.name,
    required this.dateStart,
    required this.dateEnd,
    this.overallComment = '',
    this.babysisttingComment = '',
    this.cookingComment = '',
    this.cleanningComment = '',
    this.laundryComment = '',
    this.attitudeCleanlinessComment = '',
    this.communicationComment = ''
  });
}