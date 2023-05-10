import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/colors/custom_colors.dart';
import '../components/custom_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
            textColor: CustomColors.blueDark,
            nameTitle: "Settings",
            haveBackButton: false,
            backgroundColorAppBar: CustomColors.blueLight),
        body: Column(
          children: [Text("settings")],
        ));
    ;
  }
}
