import 'package:flutter/material.dart';

import '../../utils/colors/custom_colors.dart';
import '../components/custom_app_bar.dart';

class InputSalary extends StatelessWidget {
  const InputSalary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          nameTitle: "BabySister Detail",
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: InputSalaryForm(),
    );
  }
}

class InputSalaryForm extends StatelessWidget {
  const InputSalaryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
