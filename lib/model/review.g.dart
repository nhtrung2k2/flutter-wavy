// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Review _$$_ReviewFromJson(Map<String, dynamic> json) => _$_Review(
      name: json['name'] as String?,
      dateStart: json['date_start'] as String?,
      dateEnd: json['date_end'] as String?,
      overallRating: json['overall_rating'] as int? ?? 5,
      overallComment: json['overall_comment'] as String? ?? '',
      babysittingRating: json['babysitting_rating'] as int? ?? 5,
      babysittingComment: json['babysitting_comment'] as String? ?? '',
      cookingRating: json['cooking_rating'] as int? ?? 5,
      cookingComment: json['cooking_comment'] as String? ?? '',
      cleanningRating: json['cleaning_rating'] as int? ?? 5,
      cleaningComment: json['cleaning_comment'] as String? ?? '',
      laundryRating: json['laundry_rating'] as int? ?? 5,
      launryComment: json['laundry_comment'] as String? ?? '',
      attitudeCleanlinessRating:
          json['attitude_cleanliness_rating'] as int? ?? 5,
      attitudeCleanliniessComment:
          json['attitude_cleanliness_comment'] as String? ?? '',
      communicationRating: json['communication_rating'] as int? ?? 5,
      communicationComment: json['communication_comment'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReviewToJson(_$_Review instance) => <String, dynamic>{
      'name': instance.name,
      'date_start': instance.dateStart,
      'date_end': instance.dateEnd,
      'overall_rating': instance.overallRating,
      'overall_comment': instance.overallComment,
      'babysitting_rating': instance.babysittingRating,
      'babysitting_comment': instance.babysittingComment,
      'cooking_rating': instance.cookingRating,
      'cooking_comment': instance.cookingComment,
      'cleaning_rating': instance.cleanningRating,
      'cleaning_comment': instance.cleaningComment,
      'laundry_rating': instance.laundryRating,
      'laundry_comment': instance.launryComment,
      'attitude_cleanliness_rating': instance.attitudeCleanlinessRating,
      'attitude_cleanliness_comment': instance.attitudeCleanliniessComment,
      'communication_rating': instance.communicationRating,
      'communication_comment': instance.communicationComment,
    };
