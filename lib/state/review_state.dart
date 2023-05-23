import 'package:wavy/model/employee.dart';
import 'package:wavy/model/review.dart';

enum ReviewStateStatus {
  initing,
  inited,
  initFailed,
  submitting,
  submitted,
  cannotSubmit
}

class ReviewState {
  final Employee? employee;
  final Review review;
  final ReviewStateStatus reviewStateStatus;
  const ReviewState({
    required this.employee,
    required this.review,
    required this.reviewStateStatus
  });
  factory ReviewState.initial() => const ReviewState(
    employee: null,
    review: Review(),
    reviewStateStatus: ReviewStateStatus.initing
  );

  ReviewState copyWith({
    Employee? employee,
    Review? review,
    ReviewStateStatus? reviewStateStatus
  }) {
    return ReviewState(
      employee: employee ?? this.employee,
      review: review ?? this.review,
      reviewStateStatus: reviewStateStatus ?? this.reviewStateStatus
    );
  }

}
