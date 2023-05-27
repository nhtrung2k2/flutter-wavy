import 'package:flutter/material.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/view/components/personal_information/custom_avatar.dart';

enum UserInfoType { avatar, name, id, age, address }

class UserInfo extends StatelessWidget {
  static const defaultAvatar =
      'https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png';

  final List<UserInfoType> infoType;
  final bool horizontalLayoutType;
  final String? avatarBase64;
  final String? name;
  final String? id;
  final String? age;
  final String? city;

  const UserInfo(
      {Key? key,
      required this.infoType,
      this.horizontalLayoutType = true,
      this.avatarBase64,
      this.name,
      this.id,
      this.age,
      this.city})
      : super(key: key);

  Widget _information(UserInfoType type) {
    switch (type) {
      case UserInfoType.name:
        return Text(
          name ?? '',
          style: const TextStyle(
              color: CustomColors.blueTextDark,
              fontSize: 16,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold),
        );
      case UserInfoType.id:
        return Text(
          'ID: $id',
          style: const TextStyle(
            color: CustomColors.gray,
            fontSize: 15,
            fontFamily: "Roboto",
          ),
        );
      case UserInfoType.age:
        return Text(age ?? '');
      case UserInfoType.address:
        return Text(city ?? '');
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return horizontalLayoutType
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                  visible: infoType.contains(UserInfoType.avatar),
                  child:
                      CustomAvatar(imageBase64: avatarBase64 ?? defaultAvatar)),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: infoType.map((e) => _information(e)).toList())
            ],
          )
        : Column();
  }
}
