import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/employee_bloc.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/event/employees_event.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
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
    final employees =
        context.select((EmployeeBloc bloc) => bloc.state.employees);

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
                vertical: 8,
                horizontal: 16,
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children: [
                        CardInforHome(
                            onPressed: () {
                              context.goNamed("register_baby_sister_detail");
                            },
                            avatar: employees[index].avatar,
                            name: employees[index].name,
                            age: employees[index].age,
                            city: employees[index].city),
                        const SizedBox(height: 16),
                      ]);
                    }),
              )
            ],
          ),
        ));
  }
}