import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/employee_bloc.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/event/employees_event.dart';
import 'package:wavy/model/employee.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/card_infor_home.dart';
import 'package:wavy/view/components/custom_app_bar.dart';

import '../components/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late EmployeeBloc employeeBloc;
  @override
  void initState() {
    super.initState();
    employeeBloc = context.read<EmployeeBloc>();
    employeeBloc.add(FetchEmployees());
  }

  @override
  Widget build(BuildContext context) {
    final employees = context.select((EmployeeBloc bloc) => bloc.state.employees);
    // final employees = [
    //   const Employee(
    //       id: '1',
    //       name: 'Nguyen Thi Nhan',
    //       age: '32 years old',
    //       city: 'Ho Chi Minh',
    //       shiftId: 1,
    //       cancel__contract_date: null),
    //   const Employee(
    //       id: '1',
    //       name: 'Truong Quan Nhi',
    //       age: '32 years old',
    //       city: 'Ho Chi Minh',
    //       shiftId: 1,
    //       cancel__contract_date: null),
    //   const Employee(
    //       id: '1',
    //       name: 'Nguyen Thi Nhan',
    //       age: '32 years old',
    //       city: 'Ho Chi Minh',
    //       shiftId: 1,
    //       cancel__contract_date: null),
    //   const Employee(
    //       id: '1',
    //       name: 'Nguyen Thi Nhan',
    //       age: '32 years old',
    //       city: 'Ho Chi Minh',
    //       shiftId: 1,
    //       cancel__contract_date: null),
    //   const Employee(
    //       id: '1',
    //       name: 'Nguyen Thi Nhan',
    //       age: '32 years old',
    //       city: 'Ho Chi Minh',
    //       shiftId: 1,
    //       cancel__contract_date: null),
    //   const Employee(
    //       id: '1',
    //       name: 'Nguyen Thi Nhan',
    //       age: '32 years old',
    //       city: 'Ho Chi Minh',
    //       shiftId: 1,
    //       cancel__contract_date: null),
    //   const Employee(
    //       id: '1',
    //       name: 'Nguyen Thi Nhan',
    //       age: '32 years old',
    //       city: 'Ho Chi Minh',
    //       shiftId: 1,
    //       cancel__contract_date: null),
    //   const Employee(
    //       id: '1',
    //       name: 'Nguyen Thi Nhan',
    //       age: '32 years old',
    //       city: 'Ho Chi Minh',
    //       shiftId: 1,
    //       cancel__contract_date: null)
    // ];
    return Scaffold(
        appBar: const CustomAppBar(
            textColor: CustomColors.blueDark,
            nameTitle: "Home",
            haveBackButton: false,
            backgroundColorAppBar: CustomColors.blueLight),
        body: Padding(
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
                              context.goNamed(
                                "register_baby_sister_detail",
                                queryParams: {
                                  'babysisterId': employees[index].id,
                                  'shiftId': '${employees[index].shiftId}'
                                }
                              );
                            },
                            avatar: employees[index].avatar,
                            name: employees[index].name,
                            age: employees[index].age,
                            city: employees[index].city),
                        SizedBox(height: 16.resizeheight(context)),
                      ]);
                    }),
              )
            ],
          ),
        ));
  }
}
