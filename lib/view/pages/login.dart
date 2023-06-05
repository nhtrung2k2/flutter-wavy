import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/event/login_event.dart';
import 'package:wavy/state/login_state.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/utils/svg/CustomPaintIcon.dart';
import 'package:wavy/view/components/custom_button.dart';
import 'package:wavy/view/components/loadingOverlay.dart';
import '../../bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as devtool;

import '../../service/getit/service_locator.dart';
import '../../utils/form_submission_status.dart';
import '../../utils/go_to_browser.dart';

void showErrorDialog(BuildContext context, final String title,
    final String message, final String textButton, void Function() onPressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: onPressed,
            child: Text(textButton),
          ),
        ],
      );
    },
  );
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            constraints: const BoxConstraints.expand(),
            padding: EdgeInsets.fromLTRB(40.resizewidth(context),
                159.5.resizeheight(context), 40.resizewidth(context), 0),
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.formStatus ==
                    FormSubmissionStatus.submissionsuccess) {
                  LoadingOverlay.hide();
                  context.goNamed('homePage');
                } else if (state.formStatus ==
                    FormSubmissionStatus.submissionfailed) {
                  LoadingOverlay.hide();
                  showErrorDialog(
                      context, "Error", state.errorMessage.toString(), "OK",
                      () {
                    context.pop();
                  });
                  context.read<LoginBloc>().add(LoginRestart());
                } else if (state.formStatus ==
                    FormSubmissionStatus.formsubmitting) {
                  LoadingOverlay.show(context);
                }
              },
              child: LoginForm(),
            )),
      ),
    );
  }
}

typedef StringValidator = String? Function();

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    final state = context.watch<LoginBloc>().state;
    devtool.log(state.status.name);
    String? validate() {
      return state.status == LoginStatus.invalid
          ? 'invalid email or password'
          : null;
    }

    return Form(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      CustomPaint(
        size: const Size(70, 50),
        painter: RPSCustomPainter(),
      ),
      SizedBox(height: 23.25.resizeheight(context)),
      CustomInput(
          title: "email".tr(),
          hintText: "Enter email",
          inputType: TextInputType.emailAddress,
          validator: validate,
          onchanged: (value) {
            if (value != null) {
              bloc.add(LoginEmailChanged(email: value));
            }
          }),
      SizedBox(height: 23.25.resizeheight(context)),
      CustomInput(
          title: "password".tr(),
          hintText: "Text",
          inputType: TextInputType.visiblePassword,
          validator: validate,
          onchanged: (value) {
            if (value != null) {
              bloc.add(LoginPasswordChanged(password: value));
            }
          }),
      SizedBox(height: 16.resizeheight(context)),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomTextButton(
              content: "forgotPassword".tr(),
              onPressed: () {
                onViewDetail('https://wavy-wavy.com/forgot-password');
              })
        ],
      ),
      SizedBox(height: 8.resizeheight(context)),
      CustomButton(
        onPressed: () async {
          bloc.add(Validate(
              email: bloc.state.email.value,
              password: bloc.state.password.value));

          bloc.add(LoginButtonPressed(
              email: bloc.state.email.value,
              password: bloc.state.password.value,
              language: bloc.state.language));
        },
        title: "login".tr(),
        horizontal: 50,
        vertical: 10,
      ),
      SizedBox(height: 16.resizeheight(context)),
      CustomTextButton(
        content: "createNewAcount".tr(),
        onPressed: () {
          onViewDetail('https://wavy-wavy.com/register');
        },
      ),
      Flags(
        height: 20,
        width: 30,
      )
    ]));
  }
}

class Flags extends StatelessWidget {
  Flags({super.key, required this.height, required this.width});
  final double height;
  final double width;
  final List<String> languageimages = const [
    "assets/images/england-flag.png",
    "assets/images/japan-flag.png",
    "assets/images/vietnam-flag.png"
  ];
  final LoginBloc bloc = ServiceLocator.locator.get<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: languageimages.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return IconButton(
                    iconSize: 30,
                    onPressed: () {
                      context.setLocale(
                          Locale(convertFlagToLanguage(languageimages[index])));
                      bloc.add(LanguageChanged(
                          language:
                              convertFlagToLanguage(languageimages[index])));
                    },
                    icon: Image.asset(
                      fit: BoxFit.cover,
                      height: height,
                      width: width,
                      languageimages[index],
                    ));
              }),
        ],
      ),
    );
  }
}

String convertFlagToLanguage(flag) {
  switch (flag) {
    case "assets/images/england-flag.png":
      return "en";
    case "assets/images/japan-flag.png":
      return "ja";
    case "assets/images/vietnam-flag.png":
      return "vi";
    default:
      return "en";
  }
}

class CustomTextButton extends StatelessWidget {
  final String content;
  final VoidCallback onPressed;
  const CustomTextButton(
      {required this.onPressed, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        content,
        style: const TextStyle(
          color: CustomColors.blueSea,
          fontFamily: "Roboto",
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class CustomInput extends StatefulWidget {
  final String title;
  final String hintText;
  final TextInputType inputType;
  final StringValidator validator;
  final Function(String?) onchanged;
  const CustomInput(
      {required this.title,
      required this.hintText,
      required this.inputType,
      required this.validator,
      required this.onchanged,
      super.key});
  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _visible = false;
  Widget togglePassword() {
    return IconButton(
      alignment: Alignment.bottomRight,
      iconSize: 24,
      onPressed: () {
        setState(() {
          _visible = !_visible;
        });
      },
      icon: Icon(
          _visible ? Icons.visibility_outlined : Icons.visibility_off_outlined),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,
            style: const TextStyle(
                color: CustomColors.gray,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold)),
        SizedBox(height: 8.resizeheight(context)),
        Stack(alignment: Alignment.topRight, children: [
          TextField(
            onChanged: (value) {
              widget.onchanged(value);
            },
            obscureText: widget.title == "password".tr() ? !_visible : false,
            style: const TextStyle(height: 1, fontStyle: FontStyle.normal),
            keyboardType: widget.inputType,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              errorText: widget.validator(),
              suffixIconConstraints: BoxConstraints(
                  minHeight: 16.resizeheight(context),
                  minWidth: 16.resizewidth(context)),
              isCollapsed: true,
              contentPadding: widget.title == "password".tr()
                  ? const EdgeInsets.fromLTRB(16.0, 16, 50, 16)
                  : const EdgeInsets.fromLTRB(16.0, 16, 16, 16),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.blueBorder),
                borderRadius: BorderRadius.circular(12.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.blueBorder),
                borderRadius: BorderRadius.circular(12.0),
              ),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                  color: CustomColors.gray,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w200),
            ),
          ),
          widget.title == "password".tr()
              ? togglePassword()
              : const SizedBox(
                  width: 0,
                )
        ]),
      ],
    );
  }
}
