import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/custom_button.dart';

import '../../utils/colors/custom_colors.dart';

class RegisterBabySisterId extends StatelessWidget {
  const RegisterBabySisterId({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          nameTitle: "Register new babysister",
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: RegisterBabySisterIdForm(),
    );
  }
}

class RegisterBabySisterIdForm extends StatelessWidget {
  const RegisterBabySisterIdForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Begin to match new babysiter",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 19 / 16,
                color: CustomColors.bluetext,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Please input the babysister ID",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  height: 16 / 14,
                  color: CustomColors.gray),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 32,
                    alignment: Alignment.center,
                    child: TextField(
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 0),
                          constraints: const BoxConstraints(
                            maxHeight: 32.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: CustomColors.blueBorder),
                              borderRadius: BorderRadius.circular(8)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: CustomColors.blueBorder),
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                ),
                CustomButton(
                    onPressed: () {
                      context.goNamed("register_baby_sister_infor");
                    },
                    title: "Search",
                    vertical: 8,
                    horizontal: 28.5)
              ],
            ),
          ]),
    );
  }
}
