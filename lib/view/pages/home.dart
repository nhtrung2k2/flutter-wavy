import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/view/components/card_infor_home.dart';
import 'package:wavy/view/components/custom_app_bar.dart';

import '../../model/employee.dart';
import '../components/custom_button.dart';

List<Employee> employees = const [
  Employee(
      id: '1',
      name: 'Nguyen Thi Nhan',
      age: 32,
      city: "Ho Chi Minh",
      avatar:
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"),
  Employee(
      id: '2',
      name: 'Truong Quan Nhi',
      age: 30,
      city: "Ho Chi Minh",
      avatar:
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"),
  Employee(
      id: '3',
      name: 'Truong Quan Nhi Nhi',
      age: 30,
      city: "Ho Chi Minh",
      avatar:
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"),
  Employee(
      id: '4',
      name: 'Nguyen Thi Nhan',
      age: 32,
      city: "Ho Chi Minh",
      avatar:
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"),
  Employee(
      id: '5',
      name: 'Nguyen Thi Nhan',
      age: 32,
      city: "Ho Chi Minh",
      avatar:
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"),
  Employee(
      id: '5',
      name: 'Nguyen Thi Nhan',
      age: 32,
      city: "Ho Chi Minh",
      avatar:
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"),
  Employee(
      id: '5',
      name: 'Nguyen Thi Nhan',
      age: 32,
      city: "Ho Chi Minh",
      avatar:
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"),
  Employee(
      id: '5',
      name: 'Nguyen Thi Nhan',
      age: 32,
      city: "Ho Chi Minh",
      avatar:
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"),
  Employee(
      id: '5',
      name: 'Nguyen Thi Nhan',
      age: 32,
      city: "Ho Chi Minh",
      avatar:
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"),
  Employee(
      id: '5',
      name: 'Nguyen Thi Nhan',
      age: 32,
      city: "Ho Chi Minh",
      avatar:
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"),
  Employee(
      id: '5',
      name: 'Nguyen Thi Nhan',
      age: 32,
      city: "Ho Chi Minh",
      avatar:
          "https://huyhoanhotel.com/wp-content/uploads/2016/05/765-default-avatar-320x320.png"),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
