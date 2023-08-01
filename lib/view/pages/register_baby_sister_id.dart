import 'package:easy_localization/easy_localization.dart';
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

class RegisterBabySisterId extends StatelessWidget {
  const RegisterBabySisterId({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          nameTitle: "registerNewBabysitter".tr(),
          haveBackButton: true,
          textColor: CustomColors.blueDark,
          backgroundColorAppBar: CustomColors.blueLight),
      body: const RegisterBabySisterIdForm(),
    );
  }
}

class RegisterBabySisterIdForm extends StatefulWidget {
  const RegisterBabySisterIdForm({super.key});

  @override
  State<RegisterBabySisterIdForm> createState() =>
      _RegisterBabySisterIdFormState();
}

class _RegisterBabySisterIdFormState extends State<RegisterBabySisterIdForm> {
  late final EmployeeSearchBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = context.read<EmployeeSearchBloc>();
    bloc.add(RestartEmployeeSearchEvent(value: ""));
  }

  @override
  Widget build(BuildContext context) {
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
              Text(
                "beginToMatchNewBabysitter".tr(),
                style: const TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: (19 / 16),
                  color: CustomColors.bluetext,
                ),
              ),
              SizedBox(height: 32.resizeheight(context)),
              Text(
                "pleaseInputTheBabysitterId".tr(),
                style: const TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: (16 / 14),
                    color: CustomColors.gray),
              ),
              CustomText(
                  title: "youCanSee".tr(),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  lineHeight: (16 / 14),
                  colorText: CustomColors.gray,
                  textAlign: TextAlign.center),
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
                      title: "search".tr(),
                      vertical: 8,
                      horizontal: 28.5)
                ],
              ),
              context.select((EmployeeSearchBloc bloc) => bloc.state)
                      is SubmittedError
                  ? CustomText(
                      title:
                          "thisIdDoesNotMatchWithAnyBabysitterPleaseInputTheCorrectBabysitterId"
                              .tr(),
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
