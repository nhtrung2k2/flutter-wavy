import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/bloc/user_infor_setting.dart';
import 'package:wavy/state/login_state.dart';
import 'package:wavy/utils/resize.dart';

import '../../service/getit/service_locator.dart';
import '../../state/employee_search_state.dart';
import '../../state/user_infor_settings.dart';
import '../../utils/colors/custom_colors.dart';
import '../../utils/convertBase64Image.dart';
import '../pages/baby_sister_detail.dart';
import 'custom_text.dart';
import 'loadingOverlay.dart';

class ColumnInfor extends StatelessWidget {
  const ColumnInfor(
      {super.key, required this.name, required this.id, required this.avatar});
  final String avatar;
  final String name;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.memory(convertBase64Image(avatar),
            height: 64, width: 64, fit: BoxFit.cover),
        SizedBox(
          width: 10.resizewidth(context),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: name,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                lineHeight: (16 / 14),
                colorText: CustomColors.blueTextDark,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 4),
              CustomText(
                title: "ID: $id",
                fontWeight: FontWeight.normal,
                fontSize: 14,
                lineHeight: (16 / 14),
                colorText: CustomColors.gray,
                textAlign: TextAlign.start,
              )
            ])
      ],
    );
  }
}
