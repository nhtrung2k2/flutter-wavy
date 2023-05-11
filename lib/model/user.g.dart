// GENERATED CODE - DO NOT MODIFY BY HAND

part of User;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['user_id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String? ??
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png",
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'user_id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };
