import 'package:flutter/material.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/view/components/custom_elevated_button.dart';
import 'package:wavy/view/components/custom_text.dart';

import '../components/custom_app_bar.dart';

class TerminationContractPage extends StatelessWidget {
  const TerminationContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          nameTitle: "Termination of contract",
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: TerminationContractForm(),
    );
  }
}

class TerminationContractForm extends StatelessWidget {
  const TerminationContractForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const CustomText(
            title: "Have you confirmed with your nanny",
            fontWeight: FontWeight.bold,
            fontSize: 16,
            lineHeight: 19 / 16,
            colorText: CustomColors.bluetext,
            textAlign: TextAlign.center),
        const CustomText(
            title: "[Termination of contract]",
            fontWeight: FontWeight.bold,
            fontSize: 14,
            lineHeight: 16 / 14,
            colorText: Colors.black,
            textAlign: TextAlign.center),
        Row(
          children: [
            const CustomText(
                title: "Nanny name",
                fontWeight: FontWeight.bold,
                fontSize: 14,
                lineHeight: 16 / 14,
                colorText: Colors.black,
                textAlign: TextAlign.start),
            CustomText(
                title: "Nanny name",
                fontWeight: FontWeight.bold,
                fontSize: 14,
                lineHeight: 16 / 14,
                colorText: CustomColors.bluetext,
                textAlign: TextAlign.start)
          ],
        ),
        Row(
          children: [
            const CustomText(
                title: "Date of termination:",
                fontWeight: FontWeight.bold,
                fontSize: 14,
                lineHeight: 16 / 14,
                colorText: Colors.black,
                textAlign: TextAlign.start),
            CustomText(
                title: "Nanny name",
                fontWeight: FontWeight.bold,
                fontSize: 14,
                lineHeight: 16 / 14,
                colorText: CustomColors.bluetext,
                textAlign: TextAlign.start)
          ],
        ),
        CustomText(
            title: "* Please confirm contract-end bonus with your nanny",
            fontWeight: FontWeight.normal,
            fontSize: 14,
            lineHeight: 16 / 14,
            colorText: Colors.black,
            textAlign: TextAlign.center),
        CustomElevatedButton(
            title:
                "confirmed above.\nRegister evaluation & Proceed termination",
            vertical: 8,
            horizontal: 8,
            textColor: Colors.white,
            backgroundColor: CustomColors.bluetext,
            borderRadius: 16,
            onPressed: () {})
      ]),
    );
  }
}
