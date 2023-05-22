import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/model/employee_detail.dart';
import 'package:wavy/state/employee_search_state.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/convertBase64Image.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/custom_text.dart';

import '../../model/employee.dart';

class BabySisterDetail extends StatelessWidget {
  const BabySisterDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          nameTitle: "BabySister Detail",
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: BabySisterDetailForm(),
    );
  }
}

class BabySisterDetailForm extends StatelessWidget {
  const BabySisterDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CardContactDetail(),
          SizedBox(
            height: 32.resizeheight(context),
          ),
          Expanded(
            flex: 4,
            child: CardInforDetail(),
          ),
        ],
      ),
    );
  }
}

class CardInforDetail extends StatelessWidget {
  CardInforDetail({super.key});
  final details = [
    {"icon": null, "title": "Confirm the schedule", "colorText": Colors.black},
    {"icon": null, "title": "Payments", "colorText": Colors.black},
    {"icon": null, "title": "Basic settings", "colorText": Colors.black},
    {"icon": Icons.star, "title": "Review", "colorText": Colors.black},
    {
      "icon": null,
      "title": "Cancel the contracts",
      "colorText": CustomColors.redText
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
              title: "Details",
              fontWeight: FontWeight.bold,
              fontSize: 14,
              lineHeight: 16 / 14,
              colorText: CustomColors.bluetext),
          SizedBox(
            height: 4.resizeheight(context),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: details.length,
              itemBuilder: (context, index) {
                if (index != details.length - 1) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomButtonIconNavigator(
                        onPressed: () {},
                        colorText: details[index]['colorText'] as Color,
                        title: details[index]['title'] as String,
                        iconData: details[index]['icon'] as IconData?,
                      ),
                      const Divider(
                        thickness: 2,
                      )
                    ],
                  );
                } else {
                  return CustomButtonIconNavigator(
                    onPressed: () {},
                    colorText: details[index]['colorText'] as Color,
                    title: details[index]['title'] as String,
                    iconData: details[index]['icon'] as IconData?,
                  );
                }
              })
        ],
      ),
    );
  }
}

class CustomButtonIconNavigator extends StatelessWidget {
  CustomButtonIconNavigator(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.colorText,
      required this.iconData})
      : icon = iconData != null
            ? Row(children: [
                Icon(
                  size: 25,
                  iconData,
                  color: CustomColors.yellowIcon,
                ),
                const SizedBox(
                  width: 6.09,
                )
              ])
            : const SizedBox(width: 0);
  final Function onPressed;
  final String title;
  final IconData? iconData;
  final Color colorText;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 1.5),
      child: SizedBox(
        height: 25,
        child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              onPressed();
            },
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                Expanded(
                  child: CustomText(
                      title: title,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      lineHeight: 16 / 14,
                      colorText: colorText),
                ),
                const Icon(Icons.navigate_next,
                    color: CustomColors.blueNextIcon, size: 21.5)
              ],
            )),
      ),
    );
  }
}

class CardContactDetail extends StatelessWidget {
  const CardContactDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              // const ColumnInfor(),
              SizedBox(
                height: 12.resizeheight(context),
              ),
              CardContact()
            ],
          ),
        ),
      ),
    );
  }
}

class CardContact extends StatelessWidget {
  CardContact({super.key});
  final contacts = [
    {
      "icon": Icons.call,
      "title": "Call to BabySister",
    },
    {
      "icon": Icons.file_copy,
      "title": "Copy Number",
    },
    {
      "icon": Icons.email,
      "title": "Mail to BabySister",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 18.resizeheight(context),
        ),
        const CustomText(
            title: "Contacts",
            fontWeight: FontWeight.bold,
            fontSize: 14,
            lineHeight: 16 / 14,
            colorText: CustomColors.bluetext),
        SizedBox(
          height: 20.resizeheight(context),
        ),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 6.resizewidth(context),
          mainAxisSpacing: 16,
          children: contacts
              .map(
                (contact) => TextButton.icon(
                  style: ButtonStyle(
                      alignment: Alignment.centerLeft,
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(0)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {},
                  icon: Icon(contact['icon'] as IconData,
                      color: CustomColors.bluetext, size: 25),
                  label: CustomText(
                      title: contact['title'] as String,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      lineHeight: 16 / 14,
                      colorText: Colors.black),
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: 20.resizeheight(context),
        ),
      ],
    );
  }
}

class ColumnInfor extends StatelessWidget {
  const ColumnInfor({super.key, required this.employee});
  final Employee_Detail employee;
  @override
  Widget build(BuildContext context) {
    // const employee = Employee(
    //     id: '1',
    //     name: 'Nguyen Thi Nhan',
    //     age: '32 years old',
    //     city: 'Ho Chi Minh',
    //     shiftId: 1,
    //     cancel__contract_date: null);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.memory(convertBase64Image(employee.avatar),
            height: 64, width: 64, fit: BoxFit.cover),
        SizedBox(
          width: 10.resizewidth(context),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(
              title: employee.name,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              lineHeight: (16 / 14),
              colorText: CustomColors.blueTextDark),
          const SizedBox(height: 4),
          CustomText(
              title: "ID: ${employee.id}",
              fontWeight: FontWeight.normal,
              fontSize: 14,
              lineHeight: (16 / 14),
              colorText: CustomColors.gray)
        ])
      ],
    );
  }
}
