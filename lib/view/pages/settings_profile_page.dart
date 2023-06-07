import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/event/cancel_membership_event.dart';
import 'package:wavy/event/login_event.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/state/cancel_membership_state.dart';
import 'package:wavy/state/login_state.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/custom_row_divide.dart';
import 'package:wavy/view/components/custom_text.dart';
import 'package:wavy/view/pages/baby_sister_detail.dart';

import '../../bloc/cancel_membership.dart';
import '../../bloc/logout_bloc.dart';
import '../../event/logout_event.dart';
import '../../utils/colors/custom_colors.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_card_infor.dart';
import 'dart:developer' as devtool;
import 'login.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          textColor: CustomColors.blueDark,
          nameTitle: "setting".tr(),
          haveBackButton: false,
          backgroundColorAppBar: CustomColors.blueLight),
      body: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previousState, currentState) {
          return previousState.language != currentState.language;
        },
        listener: (context, state) {
          setState(() {});
        },
        child: const SettingForm(),
      ),
    );
  }
}

class SettingForm extends StatefulWidget {
  const SettingForm({super.key});

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  late final LogoutBloc blocLogout;
  @override
  void initState() {
    blocLogout = ServiceLocator.locator.get<LogoutBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final blocLogin = context.read<LoginBloc>();

    return Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state.user != null) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomCardInfor(
                        avatar: blocLogin.state.user!.avatar,
                        name: blocLogin.state.user!.name,
                        id: blocLogin.state.user!.id,
                      ),
                      SizedBox(
                        height: 32.resizeheight(context),
                      ),
                      CustomRowDevide(
                          firstChild: CustomText(
                              title: "changeLanguage".tr(),
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              lineHeight: 16 / 14,
                              colorText: Colors.black,
                              textAlign: TextAlign.start),
                          secondChild: const SizedBox(
                              height: 40,
                              child: Flags(
                                width: 30,
                                height: 20,
                              ))),
                      BlocProvider.value(
                        value: blocLogout,
                        child: Builder(builder: (context) {
                          return CustomeButtonIconNavigatorDivide(
                            title: "logout".tr(),
                            colorText: Colors.black,
                            iconData: null,
                            onPressed: () {
                              context.read<LogoutBloc>().add(LogoutInitEvent());
                              context.read<LogoutBloc>().add(LogoutPressed());
                            },
                          );
                        }),
                      ),
                      BlocProvider.value(
                        value:
                            ServiceLocator.locator.get<CancelMemberShipBloc>(),
                        child: Builder(builder: (context) {
                          return BlocListener<CancelMemberShipBloc,
                              CancelMembershipState>(
                            listener: (context, state) {
                              if (state is CancelMembershipStateSuccess) {
                                showErrorDialog(
                                    context,
                                    "Message",
                                    "userSuccessfullyCanceledMembership".tr(),
                                    "OK", () {
                                  context
                                      .read<CancelMemberShipBloc>()
                                      .add(CancelMembershipConfirmEvent());
                                });
                              }
                            },
                            child: CustomButtonIconNavigator(
                                disabled: false,
                                onPressed: () {
                                  context
                                      .read<CancelMemberShipBloc>()
                                      .add(CancelMembershipPressed());
                                },
                                title: "cancelMembership".tr(),
                                colorText: CustomColors.redText,
                                iconData: null),
                          );
                        }),
                      )
                    ]);
              }
              return Container();
            },
          ),
        ));
  }
}

@immutable
class CustomeButtonIconNavigatorDivide extends StatelessWidget {
  final String title;
  final Color colorText;
  final IconData? iconData;
  final Function onPressed;
  const CustomeButtonIconNavigatorDivide({
    super.key,
    required this.title,
    required this.colorText,
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      CustomButtonIconNavigator(
          disabled: false,
          onPressed: onPressed,
          title: title,
          colorText: colorText,
          iconData: iconData),
      const Divider(
        height: 2.0,
      ),
    ]);
  }
}
