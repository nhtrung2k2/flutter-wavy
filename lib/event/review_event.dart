abstract class ReviewEvent {}

class InitDataEvent extends ReviewEvent {
  final String babysistterId;
  final int shiftId;
  InitDataEvent({required this.babysistterId, required this.shiftId});
}

abstract class RateEvent extends ReviewEvent {
  final int rate;
  RateEvent({required this.rate});
}

class ChangeOverallRateEvent extends RateEvent {
  ChangeOverallRateEvent({required rate}) : super(rate: rate);
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