import 'package:wavy/model/user_model.dart';

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
  UserModel userInforSetting;
  UserInforSettingSuccess(this.userInforSetting);
}
