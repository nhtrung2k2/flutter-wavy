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
  done
}

class ReviewState {
  final Employee_Detail? employee;
  final Review review;
  final ReviewStateStatus reviewStateStatus;
  final ReviewValidateStatus validateStatus;
  const ReviewState({
    required this.employee,
    required this.review,
    required this.reviewStateStatus,
    required this.validateStatus
  });
  factory ReviewState.initial() => const ReviewState(
    employee: null,
    review: Review(),
    reviewStateStatus: ReviewStateStatus.initing,
    validateStatus: ReviewValidateStatus.empty
  );

  ReviewState copyWith({
    Employee_Detail? employee,
    Review? review,
    ReviewStateStatus? reviewStateStatus,
    ReviewValidateStatus? validateStatus,
  }) {
    return ReviewState(
      employee: employee ?? this.employee,
      review: review ?? this.review,
      reviewStateStatus: reviewStateStatus ?? this.reviewStateStatus,
      validateStatus: validateStatus ?? this.validateStatus
    );
  }

}
