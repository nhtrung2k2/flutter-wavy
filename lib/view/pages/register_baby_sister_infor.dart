import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/employee_bloc.dart';
import 'package:wavy/bloc/employee_search_bloc.dart';
import 'package:wavy/model/employee.dart';
import 'package:wavy/state/employee_search_state.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/back_next.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/custom_text.dart';

import '../../utils/colors/custom_colors.dart';
import '../components/custom_elevated_button.dart';
import '../components/custom_ouline_button.dart';

class RegisterBabySisterInforPage extends StatelessWidget {
  const RegisterBabySisterInforPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          nameTitle: "Register new babysister",
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: RegisterBabySisterInfor(),
    );
  }
}

class RegisterBabySisterInfor extends StatelessWidget {
  const RegisterBabySisterInfor({super.key});
  @override
  Widget build(BuildContext context) {
    // final employee = context.select((EmployeeSearchBloc bloc) =>
    //     (bloc.state as SubmittedSuccess).employeeDetail);
    const employee = Employee(
        id: '1',
        name: 'Nguyen Thi Nhan',
        age: '32 years old',
        city: 'Ho Chi Minh',
        shiftId: 1);
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: 126.resizeheight(context)),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Begin to match new babysister",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: (19 / 16),
                    color: CustomColors.bluetext,
                  ),
                ),
                SizedBox(height: 48.resizeheight(context)),
                const Text(
                  "BabySistter",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: (16 / 14),
                      color: CustomColors.gray),
                ),
                SizedBox(height: 16.resizeheight(context)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    employee.avatar,
                    height: 100.resizeheight(context),
                    width: 100.resizewidth(context),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 10.resizeheight(context)),
                CustomText(
                    title: employee.name,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    lineHeight: (16 / 14),
                    colorText: CustomColors.blueTextDark),
                SizedBox(height: 4.resizeheight(context)),
                CustomText(
                    title: "ID: ${employee.id}",
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    lineHeight: (16 / 14),
                    colorText: CustomColors.gray),
                SizedBox(height: 48.resizeheight(context)),
                const Text("Are you sure the babysister above is correct?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        height: (16 / 14),
                        color: CustomColors.blacktext)),
                SizedBox(height: 26.resizeheight(context)),
                BackNext(
                  horizontalPadding: 10.resizewidth(context),
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
              ],
            )),
            Container(
              constraints: BoxConstraints(maxHeight: 122.resizeheight(context)),
            )
          ],
        ));
  }
}
