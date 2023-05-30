import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/employee_change_setting.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/model/employee_detail.dart';
import 'package:wavy/state/employee_change_setting.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/custom_button.dart';
import 'package:wavy/view/components/custom_elevated_button.dart';
import 'package:wavy/view/pages/register_baby_sister_schedule.dart';

import '../../bloc/employee_bloc.dart';
import '../../bloc/employee_detail.dart';
import '../../bloc/salary_bloc.dart';
import '../../bloc/schedule_cubic.dart';
import '../../event/change_setting_event.dart';
import '../../event/salary_event.dart';
import '../../state/employee_detail_state.dart';
import '../../state/schedule.dart';
import '../../utils/colors/custom_colors.dart';
import '../../utils/form_submission_status.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_card_infor.dart';
import '../components/custom_text.dart';
import '../components/loadingOverlay.dart';
import 'Input_salary.dart';
import 'dart:developer' as devtool;

class BasicSettingPage extends StatelessWidget {
  const BasicSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          nameTitle: "Basic setting",
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: BasicSettingForm(),
    );
  }
}

class BasicSettingForm extends StatefulWidget {
  const BasicSettingForm({super.key});

  @override
  State<BasicSettingForm> createState() => _BasicSettingFormState();
}

class _BasicSettingFormState extends State<BasicSettingForm> {
  late final EmployeeChangeSettingBloc employeeChangeSettingBloc;
  late final EmployeeBloc employeeBloc;
  late final EmployeeDetailBloc detailEmployeeBloc;
  late final Employee_Detail employeeDetail;
  late final int shiftId;
  late final SalaryBloc inputSalaryBloc;
  late final ScheduleCubic scheduleBloc;
  @override
  void initState() {
    super.initState();

    inputSalaryBloc = context.read<SalaryBloc>();
    scheduleBloc = context.read<ScheduleCubic>();
    detailEmployeeBloc = context.read<EmployeeDetailBloc>();
    employeeDetail =
        (detailEmployeeBloc.state as SubmittedEmployeeDetailSuccessState)
            .employeeDetail;
    employeeBloc = context.read<EmployeeBloc>();
    shiftId = employeeBloc.state.employees
        .firstWhere((e) => e.id == employeeDetail.id)
        .shiftId;
    employeeChangeSettingBloc = context.read<EmployeeChangeSettingBloc>();
    employeeChangeSettingBloc.add(OnFetchChangeSettingEvent(shiftId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmployeeChangeSettingBloc, ChangeSettingState>(
      listener: (context, state) {
        if (state is FetchLoading) {
          LoadingOverlay.show(context);
        }
        if (state is SubmittedSuccessChangeSetting) {
          context.pop();
        }
        if (state is FetchSuccess) {
          scheduleBloc.fetch(convertInputShiftListToScheduleList(
              state.shiftSalaryEmployee.inputShift));
          inputSalaryBloc.add(
              InitialFetch(inputSalary: state.shiftSalaryEmployee.inputSalary));
        }
      },
      child: BlocListener<ScheduleCubic, SheduleState>(
        listener: (context, state) {
          if (state is ScheduleFetch) {
            devtool.log(inputSalaryBloc.state.formStatus.name);

            LoadingOverlay.hide();
          }
        },
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  CustomCardInfor(
                      name: employeeDetail.name,
                      avatar: employeeDetail.avatar,
                      id: employeeDetail.id),
                  SizedBox(
                    height: 20.resizeheight(context),
                  ),
                  const CustomText(
                    title: "The Basic attendance information",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    lineHeight: (18 / 16),
                    colorText: CustomColors.blacktext,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 16.resizeheight(context),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(children: [
                      CustomText(
                        title: "Not available",
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        lineHeight: (18 / 14).resizeheight(context),
                        colorText: CustomColors.blacktext,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.resizeheight(context),
                      ),
                    ]),
                  ),
                  const RegisterBabySisterScheduleForm(),
                  SizedBox(
                    height: 36.resizeheight(context),
                  ),
                  const CustomText(
                    title: "Automatic addition",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    lineHeight: (18 / 16),
                    colorText: CustomColors.blacktext,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 16.resizeheight(context)),
                  const InputSalaryForm(),
                  SizedBox(height: 16.resizeheight(context)),
                  Center(
                    child: CustomElevatedButton(
                        title: 'Update',
                        vertical: 8,
                        horizontal: 16,
                        textColor: Colors.white,
                        backgroundColor: CustomColors.blueBorder,
                        borderRadius: 8,
                        onPressed: () {
                          context.read<EmployeeChangeSettingBloc>().add(
                              OnSubmmitedChangeSettingEvent(
                                  shiftId: shiftId,
                                  babysistterId: (detailEmployeeBloc.state
                                          as SubmittedEmployeeDetailSuccessState)
                                      .employeeDetail
                                      .id,
                                  inputShifts:
                                      (scheduleBloc.state.listSchedule),
                                  inputSalary:
                                      (inputSalaryBloc.state.inputSalary)));
                        }),
                  ),
                ]))),
      ),
    );
  }
}
