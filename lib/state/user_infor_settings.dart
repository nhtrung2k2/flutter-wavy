import 'package:wavy/model/User.dart';

abstract class UserInforSettingState {
  UserInforSettingState();
}

class UserInforSettingStateInitial extends UserInforSettingState {
  UserInforSettingStateInitial();
}

class UserInforSettingLoading extends UserInforSettingState {
  UserInforSettingLoading();
}

class UserInforSettingFail extends UserInforSettingState {
  String errorMessage;
  UserInforSettingFail(this.errorMessage);
}

class UserInforSettingSuccess extends UserInforSettingState {
  User userInforSetting;
  UserInforSettingSuccess(this.userInforSetting);
}
