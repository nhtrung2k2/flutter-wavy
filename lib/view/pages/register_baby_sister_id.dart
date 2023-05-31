import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/bloc/employee_search_bloc.dart';
import 'package:wavy/state/employee_search_state.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/custom_button.dart';
import 'package:wavy/view/components/custom_text.dart';

import '../../event/search_event.dart';
import '../../utils/colors/custom_colors.dart';
import 'dart:developer' as devtool;

class RegisterBabySisterId extends StatelessWidget {
  const RegisterBabySisterId({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          nameTitle: "Register new babysister",
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: RegisterBabySisterIdForm(),
    );
  }
}

class RegisterBabySisterIdForm extends StatelessWidget {
  const RegisterBabySisterIdForm({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EmployeeSearchBloc>();
    return BlocListener<EmployeeSearchBloc, SearchState>(
      listener: (context, state) {
        if (bloc.state is SubmittedSuccess) {
          context.goNamed("register_baby_sister_infor");
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 0, horizontal: 16.resizewidth(context)),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Begin to match new babysiter",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: (19 / 16),
                  color: CustomColors.bluetext,
                ),
              ),
              SizedBox(height: 32.resizeheight(context)),
              const Text(
                "Please input the babysister ID",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: (16 / 14),
                    color: CustomColors.gray),
              ),
              SizedBox(height: 16.resizeheight(context)),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 32,
                      alignment: Alignment.center,
                      child: TextField(
                        onChanged: (value) =>
                            bloc.add(OnChangedValue(value: value)),
                        maxLines: 1,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 0),
                            constraints: const BoxConstraints(
                              maxHeight: 32.0,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: CustomColors.blueBorder),
                                borderRadius: BorderRadius.circular(8)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: CustomColors.blueBorder),
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  CustomButton(
                      onPressed: () {
                        if (bloc.state is ChangedState) {
                          bloc.add(OnSubmmited(
                              value: (bloc.state as ChangedState).value));
                        } else if (bloc.state is SubmittedSuccess) {
                          bloc.add(OnSubmmited(
                              value: (bloc.state as SubmittedSuccess)
                                  .employeeDetail
                                  .id));
                        }
                        // context.goNamed("register_baby_sister_infor");
                      },
                      title: "Search",
                      vertical: 8,
                      horizontal: 28.5)
                ],
              ),
              context.select((EmployeeSearchBloc bloc) => bloc.state)
                      is SubmittedError
                  ? const CustomText(
                      title:
                          "This ID does not match with any babysitter.Please input the correct babysitter ID.",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      lineHeight: 16 / 14,
                      colorText: CustomColors.redText,
                      textAlign: TextAlign.center,
                    )
                  : Container()
            ]),
      ),
    );
  }
}
