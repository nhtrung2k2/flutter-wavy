
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wavy/model/item.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
abstract class Review with _$Review {
  const factory Review({
      @JsonKey(name: 'name')
      String? name,
      @JsonKey(name: 'date_start')
      String? dateStart,
      @JsonKey(name: 'date_end')
      String? dateEnd,
      @JsonKey(name: 'overall_rating')
      @Default(5)
      int overallRating,
      @JsonKey(name: 'overall_comment')
      @Default('')
      String overallComment,
      @JsonKey(name: 'babysitting_rating')
      @Default(5)
      int babysittingRating,
      @JsonKey(name: 'babysitting_comment')
      @Default('')
      String babysittingComment,
      @JsonKey(name: 'cooking_rating')
      @Default(5)
      int cookingRating,
      @JsonKey(name: 'cooking_comment')
      @Default('')
      String cookingComment,
      @JsonKey(name: 'cleaning_rating')
      @Default(5)
      int cleanningRating,
      @JsonKey(name: 'cleaning_comment')
      @Default('')
      String cleaningComment,
      @JsonKey(name: 'laundry_rating')
      @Default(5)
      int laundryRating,
      @JsonKey(name: 'laundry_comment')
      @Default('')
      String launryComment,
      @JsonKey(name: 'attitude_cleanliness_rating')
      @Default(5)
      int attitudeCleanlinessRating,
      @JsonKey(name: 'attitude_cleanliness_comment')
      @Default('')
      String attitudeCleanliniessComment,
      @JsonKey(name: 'communication_rating')
      @Default(5)
      int communicationRating,
      @JsonKey(name: 'communication_comment')
      @Default('')
      String communicationComment,

  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}