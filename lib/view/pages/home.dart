import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/employee_bloc.dart';
import 'package:wavy/bloc/employee_detail.dart';

import 'package:wavy/event/employee_detail_event.dart';

import 'package:wavy/model/employee.dart';
import 'package:wavy/state/employee_detail_state.dart';

import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/card_infor_home.dart';
import 'package:wavy/view/components/custom_app_bar.dart';

import '../components/custom_button.dart';
import "dart:developer" as devtool;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
//  with WidgetsBindingObserver
{
  @override
  void initState() {
    super.initState();
    // final EmployeeBloc employeeBloc = context.read<EmployeeBloc>();
    // employeeBloc.add(FetchEmployees());
    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   // super.didChangeAppLifecycleState(state);
  //   devtool.log(state.name);
  //   if (state == AppLifecycleState.resumed) {
  //     final EmployeeBloc employeeBloc = context.read<EmployeeBloc>();
  //     employeeBloc.add(FetchEmployees());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    List<Employee> employees = context.watch<EmployeeBloc>().state.employees;
    final EmployeeDetailBloc employeeDetailBloc =
        context.read<EmployeeDetailBloc>();

    return Scaffold(
        appBar: const CustomAppBar(
            textColor: CustomColors.blueDark,
            nameTitle: "Home",
            haveBackButton: false,
            backgroundColorAppBar: CustomColors.blueLight),
        body: BlocListener<EmployeeDetailBloc, EmployeeDetailState>(
          listener: (context, state) {
            if (state is SubmittedEmployeeDetailSuccessState) {
              context.goNamed("register_baby_sister_detail");
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomButton(
                  onPressed: () {
                    context.goNamed("register-babysister-id");
                  },
                  title: "Register new babysister",
                  vertical: 8.resizeheight(context),
                  horizontal: 16.resizewidth(context),
                ),
                SizedBox(height: 16.resizeheight(context)),
                Flexible(
                  child: ListView.builder(
                      itemCount: employees.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(children: [
                          CardInforHome(
                              onPressed: () {
                                if (employeeDetailBloc.state
                                    is! SubmittedEmployeeDetailLoadingState) {
                                  employeeDetailBloc.add(OnSubmmited(
                                      babysisterDetailId: employees[index].id,
                                      shiftId: employees[index].shiftId));
                                }
                              },
                              avatar: employees[index].avatar,
                              name: employees[index].name,
                              age: employees[index].age,
                              city: employees[index].city),
                          SizedBox(height: 16.resizeheight(context)),
                        ]);
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
