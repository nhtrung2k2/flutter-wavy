// import 'package:flutter/material.dart';
// import 'package:wavy/repository/user_repository.dart';
// import 'package:wavy/state/user_infor_settings.dart';
// import 'package:bloc/bloc.dart';

// import '../model/User.dart';
// import 'dart:developer' as devtool;

// class UserInforSettingCubic extends Cubit<UserInforSettingState> {
//   final UserRepository userRepo;
//   UserInforSettingCubic(this.userRepo) : super(UserInforSettingLoading());
//   Future<void> getInforUser() async {
//     try {
//       devtool.log("before userRepo");
//       final user = await userRepo.getUserInforSetting();
//       devtool.log("user");
//       devtool.log(user.toString());
//       if (user == null) {
//         throw Exception("you might delete catch infor user");
//       }
//       emit(UserInforSettingSuccess(user));
//     } catch (e) {
//       devtool.log("fail");
//       emit(UserInforSettingFail(e.toString()));
//     }
//   }
// }
