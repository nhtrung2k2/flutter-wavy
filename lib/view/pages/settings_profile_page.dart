import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/bloc/login_bloc.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/custom_row_divide.dart';
import 'package:wavy/view/components/custom_text.dart';
import 'package:wavy/view/pages/baby_sister_detail.dart';

import '../../bloc/logout_bloc.dart';
import '../../event/logout_event.dart';
import '../../utils/colors/custom_colors.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_card_infor.dart';

import 'login.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
          textColor: CustomColors.blueDark,
          nameTitle: "Settings",
          haveBackButton: false,
          backgroundColorAppBar: CustomColors.blueLight),
      body: SettingForm(),
    );
  }
}

class SettingForm extends StatelessWidget {
  const SettingForm({super.key});

  @override
  Widget build(BuildContext context) {
    final blocLogin = context.read<LoginBloc>();
    return Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
            child: Column(
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
                  firstChild: const CustomText(
                      title: "Change language",
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      lineHeight: 16 / 14,
                      colorText: Colors.black,
                      textAlign: TextAlign.start),
                  secondChild: SizedBox(
                      height: 40,
                      child: Flags(
                        width: 30,
                        height: 20,
                      ))),
              BlocProvider(
                create: (context) => ServiceLocator.locator.get<LogoutBloc>(),
                child: Builder(builder: (context) {
                  return CustomeButtonIconNavigatorDivide(
                    title: "Logout",
                    colorText: Colors.black,
                    iconData: null,
                    onPressed: () {
                      context.read<LogoutBloc>().add(LogoutPressed());
                    },
                  );
                }),
              ),
              CustomButtonIconNavigator(
                  disabled: false,
                  onPressed: () {},
                  title: "Cancel membership",
                  colorText: CustomColors.redText,
                  iconData: null)
            ])));
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
