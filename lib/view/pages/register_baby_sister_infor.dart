import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:wavy/bloc/employee_search_bloc.dart';
import 'package:wavy/bloc/salary_bloc.dart';
import 'package:wavy/bloc/schedule_cubic.dart';
import 'package:wavy/model/schedule.dart';
import 'package:wavy/service/getit/service_locator.dart';

import 'package:wavy/state/employee_search_state.dart';
import 'package:wavy/utils/convertBase64Image.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/back_next.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/custom_text.dart';

import '../../event/salary_event.dart';
import '../../utils/colors/custom_colors.dart';

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
    final employee = context.select((EmployeeSearchBloc bloc) =>
        (bloc.state as SubmittedSuccess).employeeDetail);
    // const employee = Employee(
    //     id: '1',
    //     name: 'Nguyen Thi Nhan',
    //     age: '32 years old',
    //     city: 'Ho Chi Minh',
    //     shiftId: 1,
    //     cancel__contract_date: null);
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 26),
        child: Center(
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
                child: Image.memory(
                  convertBase64Image(employee.avatar),
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 10.resizeheight(context)),
              CustomText(
                title: employee.name,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                lineHeight: (16 / 14),
                colorText: CustomColors.blueTextDark,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4.resizeheight(context)),
              CustomText(
                  title: "ID: ${employee.id}",
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  lineHeight: (16 / 14),
                  colorText: CustomColors.gray,
                  textAlign: TextAlign.center),
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
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: ServiceLocator.locator.get<ScheduleCubic>(),
                  ),
                  BlocProvider.value(
                      value: ServiceLocator.locator.get<SalaryBloc>()),
                ],
                child: Builder(builder: (context) {
                  return BackNext(
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
                      context.read<ScheduleCubic>().initEvent();
                      context.read<SalaryBloc>().add(InitEvent());
                      context.goNamed("register_baby_sister_schedule");
                    },
                  );
                }),
              ),
            ],
          ),
        ));
  }
}
