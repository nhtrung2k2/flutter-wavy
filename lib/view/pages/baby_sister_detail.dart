import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wavy/bloc/employee_detail.dart';

import 'package:wavy/state/employee_detail_state.dart';

import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/launchEmail.dart';

import 'package:wavy/utils/resize.dart';
import 'package:wavy/utils/routesName.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/custom_text.dart';

import '../../utils/makePhoneCall.dart';
import '../components/custom_column_infor.dart';
import 'package:flutter/services.dart';

class BabySisterDetail extends StatelessWidget {
  final String babysisterId;
  final int shiftId;

  const BabySisterDetail(
      {required this.babysisterId, required this.shiftId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          nameTitle: "babysitterDetail".tr(),
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: BabySisterDetailForm(
        babysisterId: babysisterId,
        shiftId: shiftId,
      ),
    );
  }
}

class BabySisterDetailForm extends StatelessWidget {
  final String babysisterId;
  final int shiftId;

  const BabySisterDetailForm(
      {required this.babysisterId, required this.shiftId, super.key});

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
            child: CardInforDetail(
              babysisterId: babysisterId,
              shiftId: shiftId,
            ),
          ),
        ],
      ),
    );
  }
}

class CardInforDetail extends StatelessWidget {
  final String babysisterId;
  final int shiftId;

  CardInforDetail(
      {required this.babysisterId, required this.shiftId, super.key});
  final details = [
    {
      "icon": null,
      "title": "confirmTheSchedule".tr(),
      "colorText": Colors.black,
      'route': RoutesName.babysisterConfirmTheSchedule.name
    },
    {
      "icon": null,
      "title": "payments".tr(),
      "colorText": Colors.black,
      'route': RoutesName.babysisterPayment.name
    },
    {
      "icon": null,
      "title": "basicSetting".tr(),
      "colorText": Colors.black,
      'route': RoutesName.basicSettingRoute.name
    },
    {
      "icon": Icons.star,
      "title": "review".tr(),
      "colorText": Colors.black,
      'route': RoutesName.babysisterReview.name
    },
    {
      "icon": null,
      "title": "cancelTheContract".tr(),
      "colorText": CustomColors.redText,
      'route': RoutesName.cancelTheContractRoute.name
    }
  ];
  @override
  Widget build(BuildContext context) {
    final employee = (context.watch<EmployeeDetailBloc>().state
            as SubmittedEmployeeDetailSuccessState)
        .employeeDetail;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: "details".tr(),
            fontWeight: FontWeight.bold,
            fontSize: 14,
            lineHeight: 16 / 14,
            colorText: CustomColors.bluetext,
            textAlign: TextAlign.start,
          ),
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
                      if (index != 2)
                        CustomButtonIconNavigator(
                          disabled: false,
                          onPressed: () {
                            if (index == 0 || index == 1 || index == 3) {
                              context.goNamed(details[index]['route'] as String,
                                  queryParams: {
                                    'babysisterId': babysisterId,
                                    'shiftId': '$shiftId'
                                  });
                            } else if (details[index]['route'] != null) {
                              context.goNamed(details[index]['route'] as String,
                                  queryParams: {
                                    'babysisterId': babysisterId,
                                    'shiftId': '$shiftId'
                                  });
                            }
                          },
                          colorText: details[index]['colorText'] as Color,
                          title: details[index]['title'] as String,
                          iconData: details[index]['icon'] as IconData?,
                        ),
                      if (index == 2)
                        CustomButtonIconNavigator(
                          disabled: employee.cancel__contract_date != null,
                          onPressed: () {
                            if (details[index]['route'] != null) {
                              context.goNamed(details[index]['route'] as String,
                                  queryParams: {
                                    'babysisterId': babysisterId,
                                    'shiftId': '$shiftId'
                                  });
                            }
                          },
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
                    disabled: false,
                    onPressed: () {
                      if (details[index]['route'] != null) {
                        context.goNamed(details[index]['route'] as String,
                            queryParams: {
                              'babysisterId': babysisterId,
                              'shiftId': '$shiftId'
                            });
                      }
                    },
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
      required this.iconData,
      required this.disabled})
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
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: disabled ? CustomColors.backgroundGray : null,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 1.5),
          child: SizedBox(
            height: 25,
            child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: disabled == true
                    ? null
                    : () {
                        onPressed();
                      },
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          icon,
                          Expanded(
                            child: CustomText(
                              title: title,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              lineHeight: 16 / 14,
                              colorText: colorText,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.navigate_next,
                        color: CustomColors.blueNextIcon, size: 21.5)
                  ],
                )),
          ),
        ));
  }
}

class CardContactDetail extends StatelessWidget {
  const CardContactDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final employee = (context.watch<EmployeeDetailBloc>().state
            as SubmittedEmployeeDetailSuccessState)
        .employeeDetail;
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
              ColumnInfor(
                name: employee.name,
                avatar: employee.avatar,
                id: employee.id,
              ),
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
      "title": "callToBabysitter".tr(),
    },
    {
      "icon": Icons.file_copy,
      "title": "copyNumber".tr(),
    },
    {
      "icon": Icons.email,
      "title": "mailToBabysitter".tr(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    final employee = (context.watch<EmployeeDetailBloc>().state
            as SubmittedEmployeeDetailSuccessState)
        .employeeDetail;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 18.resizeheight(context),
        ),
        CustomText(
          title: "contacts".tr(),
          fontWeight: FontWeight.bold,
          fontSize: 14,
          lineHeight: 16 / 14,
          colorText: CustomColors.bluetext,
          textAlign: TextAlign.start,
        ),
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
                  onPressed: () {
                    if ((contact['title'] as String) ==
                        "callToBabysitter".tr()) {
                      makePhoneCall(employee.phone);
                    } else if ((contact['title'] as String) ==
                        "copyNumber".tr()) {
                      Clipboard.setData(ClipboardData(text: employee.phone))
                          .then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Number copied ")));
                      });
                    } else if ((contact['title'] as String) ==
                        "mailToBabysitter".tr()) {
                      try {
                        launchEmail(employee.email);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    }
                  },
                  icon: Icon(contact['icon'] as IconData,
                      color: CustomColors.bluetext, size: 25),
                  label: CustomText(
                    title: contact['title'] as String,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    lineHeight: 16 / 14,
                    colorText: Colors.black,
                    textAlign: TextAlign.start,
                  ),
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

// class ColumnInfor extends StatelessWidget {
//   const ColumnInfor({super.key, required this.employee});
//   final Employee_Detail employee;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Image.memory(convertBase64Image(employee.avatar),
//             height: 64, width: 64, fit: BoxFit.cover),
//         SizedBox(
//           width: 10.resizewidth(context),
//         ),
//         Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomText(
//                 title: employee.name,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//                 lineHeight: (16 / 14),
//                 colorText: CustomColors.blueTextDark,
//                 textAlign: TextAlign.start,
//               ),
//               const SizedBox(height: 4),
//               CustomText(
//                 title: "ID: ${employee.id}",
//                 fontWeight: FontWeight.normal,
//                 fontSize: 14,
//                 lineHeight: (16 / 14),
//                 colorText: CustomColors.gray,
//                 textAlign: TextAlign.start,
//               )
//             ])
//       ],
//     );
//   }
// }
