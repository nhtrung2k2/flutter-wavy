import 'package:wavy/model/employee_detail.dart';
import 'package:wavy/model/review.dart';

enum ReviewStateStatus {
  initing,
  inited,
  initFailed,
  submitting,
  submitted,
  cannotSubmit
}

enum ReviewValidateStatus {
  empty,
  emptyName,
  startDateFormat,
  endDateFormat,
  emptyOverallComment,
  emptyCommunationComment,
  emptyAttCleanComment,
  emptyOverallRatting,
  emptyCommunicationRatting,
  emptyAttCleanRatting,
  done
}

class ReviewState {
  final Employee_Detail? employee;
  final Review review;
  final ReviewStateStatus reviewStateStatus;
  final List<ReviewValidateStatus> validateStatus;
  final bool isBabysittingProvided;
  final bool isCookingProvided;
  final bool isLaundryProvided;
  final bool isCleaningProvided;
  final String? message;
  const ReviewState(
      {required this.employee,
      required this.review,
      required this.reviewStateStatus,
      required this.validateStatus,
      required this.isBabysittingProvided,
      required this.isCookingProvided,
      required this.isLaundryProvided,
      required this.isCleaningProvided,
      this.message});
  factory ReviewState.initial() => const ReviewState(
      employee: null,
      review: Review(),
      reviewStateStatus: ReviewStateStatus.initing,
      validateStatus: [],
      isBabysittingProvided: true,
      isCookingProvided: true,
      isLaundryProvided: true,
      isCleaningProvided: true);

  ReviewState copyWith(
      {Employee_Detail? employee,
      Review? review,
      ReviewStateStatus? reviewStateStatus,
      List<ReviewValidateStatus>? validateStatus,
      bool? isBabysittingProvided,
      bool? isCookingProvided,
      bool? isLaundryProvided,
      bool? isCleaningProvided,
      String? message}) {
    return ReviewState(
        employee: employee ?? this.employee,
        review: review ?? this.review,
        reviewStateStatus: reviewStateStatus ?? this.reviewStateStatus,
        validateStatus: validateStatus ?? this.validateStatus,
        isBabysittingProvided:
            isBabysittingProvided ?? this.isBabysittingProvided,
        isCookingProvided: isCookingProvided ?? this.isCookingProvided,
        isLaundryProvided: isLaundryProvided ?? this.isLaundryProvided,
        isCleaningProvided: isCleaningProvided ?? this.isCleaningProvided,
        message: message ?? this.message);
  }
}
