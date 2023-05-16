import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/utils/resize.dart';

import '../../utils/colors/custom_colors.dart';
import '../components/back_next.dart';
import '../components/begin_to_match_new_babysiter.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_text.dart';

class InputSalaryPage extends StatelessWidget {
  const InputSalaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          nameTitle: "Register new babysistter",
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: InputSalary(),
    );
  }
}

class InputSalary extends StatelessWidget {
  const InputSalary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(flex: 1, child: BeginToMatchBabySister()),
            const CustomText(
                title: "Please input shift",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                lineHeight: (18 / 16),
                colorText: CustomColors.blacktext),
            Expanded(flex: 2, child: Container()),
            BackNext(
              horizontalPadding: 10.resizewidth(context),
              firstButton: "Back",
              secondButton: "Next",
              verticalfirstButton: 16.resizeheight(context),
              horizontalfirstButton: 38.5.resizewidth(context),
              verticalsecondButton: 16.resizeheight(context),
              horizontalsecondButton: 38.5.resizewidth(context),
              onPressedButtonFirst: () {
                GoRouter.of(context).pop();
              },
              onPressedButtonSecond: () {
                context.goNamed("register_baby_sister_input_detail");
              },
            ),
          ],
        ));
  }
}

class InputSalaryForm extends StatelessWidget {
  const InputSalaryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class ItemSalary extends StatelessWidget {
  const ItemSalary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(),
      ],
    );
  }
}
