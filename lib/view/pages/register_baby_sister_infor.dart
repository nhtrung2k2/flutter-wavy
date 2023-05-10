import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/model/employee.dart';
import 'package:wavy/view/components/back_next.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/custom_text.dart';

import '../../utils/colors/custom_colors.dart';
import '../components/custom_elevated_button.dart';
import '../components/custom_ouline_button.dart';

class RegisterBabySisterInforPage extends StatelessWidget {
  const RegisterBabySisterInforPage({super.key, required this.employee});
  final Employee employee;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          nameTitle: "Register new babysister",
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: RegisterBabySisterInfor(
        employee: employee,
      ),
    );
  }
}

class RegisterBabySisterInfor extends StatelessWidget {
  const RegisterBabySisterInfor({super.key, required this.employee});
  final Employee employee;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Begin to match new babysister",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        height: 19 / 16,
                        color: CustomColors.bluetext,
                      ),
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      "BabySistter",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          height: 16 / 14,
                          color: CustomColors.gray),
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        employee.avatar,
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                        title: employee.name,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        lineHeight: 16 / 14,
                        colorText: CustomColors.blueTextDark),
                    const SizedBox(height: 4),
                    CustomText(
                        title: "ID: ${employee.id}",
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        lineHeight: 16 / 14,
                        colorText: CustomColors.gray),
                    const SizedBox(height: 48),
                    const Text("Are you sure the babysister above is correct?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            height: 16 / 14,
                            color: CustomColors.blacktext)),
                    const SizedBox(height: 4),
                    Expanded(
                      child: BackNext(
                        horizontalPadding: 10,
                        firstButton: "No",
                        secondButton: "Yes",
                        verticalfirstButton: 16,
                        horizontalfirstButton: 41,
                        verticalsecondButton: 16,
                        horizontalsecondButton: 38.5,
                        onPressedButtonFirst: () {
                          GoRouter.of(context).pop();
                        },
                        onPressedButtonSecond: () {
                          context.goNamed("register_baby_sister_schedule");
                        },
                      ),
                      //     child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [

                      //     CustomOutLineButton(
                      //       title: "No",
                      //       vertical: 8,
                      //       horizontal: 41,
                      //       textColor: CustomColors.blueBorder,
                      //       backgroundColor: Colors.white,
                      //       borderSideColor: CustomColors.blueBorder,
                      //       borderRadius: 8,
                      //       widthRadius: 1,
                      //       onPressed: () {
                      //
                      //       },
                      //     ),
                      //     CustomElevatedButton(
                      //       title: "Yes",
                      //       vertical: 8,
                      //       horizontal: 32.5,
                      //       textColor: Colors.white,
                      //       backgroundColor: CustomColors.blueBorder,
                      //       borderRadius: 8,
                      //       onPressed: () {
                      //         context.goNamed("register_baby_sister_schedule");
                      //       },
                      //     )
                      //   ],
                      // )
                    )
                  ],
                )),
            const Spacer(flex: 1),
          ],
        ));
  }
}
