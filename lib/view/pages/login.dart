import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/event/login_event.dart';
import 'package:wavy/state/login_state.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/utils/svg/CustomPaintIcon.dart';
import 'package:wavy/view/components/custom_button.dart';
import 'package:wavy/view/components/custom_text.dart';
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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoginBloc>().add(LoginIniTial(context.locale.languageCode));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: OrientationBuilder(builder: (context, orientation) {
          return Container(
              constraints: const BoxConstraints.expand(),
              padding: EdgeInsets.fromLTRB(
                  40.resizewidth(context),
                  orientation == Orientation.landscape
                      ? 10.resizeheight(context)
                      : 159.5.resizeheight(context),
                  40.resizewidth(context),
                  0),
              child: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.formStatus ==
                      FormSubmissionStatus.submissionsuccess) {
                    LoadingOverlay.hide();
                    context.goNamed('homePage');
                  } else if (state.formStatus ==
                      FormSubmissionStatus.submissionfailed) {
                    LoadingOverlay.hide();
                    showErrorDialog(context, "error".tr(),
                        state.errorMessage.toString(), "yes".tr(), () {
                      context.pop();
                    });
                    context.read<LoginBloc>().add(LoginRestart());
                  } else if (state.formStatus ==
                      FormSubmissionStatus.formsubmitting) {
                    LoadingOverlay.show(context);
                  }
                },
                child: const LoginForm(),
              ));
        }),
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

    final state = context.select((LoginBloc blocb) => blocb.state);
    String? validateEmail() {
      if (state.invalidError == InvalidError.invalidEmailAndPassword) {
        return 'emailIsEnteredInvalid'.tr();
      } else if (state.invalidError == InvalidError.invalidEmail) {
        return 'emailIsEnteredInvalid'.tr();
      }
      return null;
    }

    String? validatePassword() {
      if (state.invalidError == InvalidError.invalidEmailAndPassword) {
        return 'passwordIsRequired'.tr();
      } else if (state.invalidError == InvalidError.invalidPassword) {
        return 'passwordIsRequired'.tr();
      }
      return null;
    }

    return OrientationBuilder(builder: (context, orientation) {
      return Form(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        CustomPaint(
          size: Size(orientation == Orientation.landscape ? 50 : 70,
              orientation == Orientation.landscape ? 30 : 50),
          painter: RPSCustomPainter(),
        ),
        SizedBox(
            height: orientation == Orientation.landscape
                ? 0
                : 23.25.resizeheight(context)),
        CustomInput(
            inititialValue: state.email.value,
            title: "email".tr(),
            hintText: "enterEmail".tr(),
            inputType: TextInputType.emailAddress,
            validator: validateEmail,
            onchanged: (value) {
              if (value != null) {
                bloc.add(LoginEmailChanged(email: value));
              }
            }),
        SizedBox(
            height: orientation == Orientation.landscape
                ? 0
                : 23.25.resizeheight(context)),
        CustomInput(
            inititialValue: state.password.value,
            title: "password".tr(),
            hintText: "enterPassword".tr(),
            inputType: TextInputType.visiblePassword,
            validator: validatePassword,
            onchanged: (value) {
              if (value != null) {
                bloc.add(LoginPasswordChanged(password: value));
              }
            }),
        SizedBox(
            height: orientation == Orientation.landscape
                ? 0
                : 16.resizeheight(context)),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            orientation == Orientation.landscape
                ? CustomTextButton(
                    content: "createNewAccount".tr(),
                    onPressed: () {
                      onViewDetail('https://wavy-wavy.com/register');
                    },
                  )
                : const SizedBox(
                    width: 0,
                  ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SavePasswordCheckBox(),
                  CustomTextButton(
                      content: "forgotPassword".tr(),
                      onPressed: () {
                        onViewDetail('https://wavy-wavy.com/forgot-password');
                      }),
                ],
              ),
            )
          ],
        ),
        SizedBox(
            height: orientation == Orientation.landscape
                ? 0
                : 8.resizeheight(context)),
        CustomButton(
          onPressed: () async {
            bloc.add(Validate(
                email: bloc.state.email.value,
                password: bloc.state.password.value));

            bloc.add(LoginButtonPressed(
              email: bloc.state.email.value,
              password: bloc.state.password.value,
              language: bloc.state.language,
              isSavePassword: bloc.state.isSavePassword,
            ));
          },
          title: "login".tr(),
          horizontal: 50,
          vertical: 10,
        ),
        SizedBox(height: 16.resizeheight(context)),
        orientation == Orientation.landscape
            ? const SizedBox()
            : CustomTextButton(
                content: "createNewAccount".tr(),
                onPressed: () {
                  onViewDetail('https://wavy-wavy.com/register');
                },
              ),
        const Flags(
          height: 40,
          width: 30,
        )
      ]));
    });
  }
}

class SavePasswordCheckBox extends StatelessWidget {
  const SavePasswordCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    final stateLogin = context.watch<LoginBloc>().state;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
          child: Checkbox(
              value: stateLogin.isSavePassword,
              onChanged: (bool? value) {
                if (value != null) {
                  context
                      .read<LoginBloc>()
                      .add(SavePasswordPressed(isSavePassword: value));
                }
              }),
        ),
        SizedBox(
          width: 4.resizewidth(context),
        ),
        CustomText(
            title: "rememberPassword".tr(),
            fontWeight: FontWeight.normal,
            fontSize: 13,
            lineHeight: 16 / 14,
            colorText: CustomColors.blueSea,
            textAlign: TextAlign.start)
      ],
    );
  }
}

class Flags extends StatelessWidget {
  const Flags({super.key, required this.height, required this.width});
  final double height;
  final double width;
  final List<String> languageimages = const [
    "assets/images/england-flag.png",
    "assets/images/japan-flag.png",
    "assets/images/vietnam-flag.png"
  ];

  @override
  Widget build(BuildContext context) {
    final LoginBloc bloc = context.read<LoginBloc>();
    return SizedBox(
      height: 35,
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
                      final flag =
                          convertFlagToLanguageLocale(languageimages[index]);

                      bloc.add(LanguageChanged(
                          language:
                              convertFlagToLanguage(languageimages[index])));
                      context.setLocale(Locale(flag[0], flag[1]));
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

List<String> convertFlagToLanguageLocale(flag) {
  switch (flag) {
    case "assets/images/england-flag.png":
      return ['en', 'US'];
    case "assets/images/japan-flag.png":
      return ['ja', 'JP'];
    case "assets/images/vietnam-flag.png":
      return ['vi', 'VN'];
    default:
      return ['en', 'US'];
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
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class CustomInputStateless extends StatelessWidget {
  const CustomInputStateless(
      {required this.inititialValue,
      required this.title,
      required this.hintText,
      required this.inputType,
      required this.validator,
      required this.onchanged,
      super.key});
  final String inititialValue;
  final String title;
  final String hintText;
  final TextInputType inputType;
  final StringValidator validator;
  final Function(String?) onchanged;

  @override
  Widget build(BuildContext context) {
    return CustomInput(
      inititialValue: inititialValue,
      title: title,
      hintText: hintText,
      inputType: inputType,
      validator: validator,
      onchanged: onchanged,
    );
  }
}

class CustomInput extends StatefulWidget {
  final String inititialValue;
  final String title;
  final String hintText;
  final TextInputType inputType;
  final StringValidator validator;
  final Function(String?) onchanged;
  const CustomInput(
      {required this.inititialValue,
      required this.title,
      required this.hintText,
      required this.inputType,
      required this.validator,
      required this.onchanged,
      super.key});
  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  final TextEditingController _textFieldController = TextEditingController();
  bool _visible = false;
  late LoginBloc loginBloc;
  @override
  void initState() {
    super.initState();
    loginBloc = context.read<LoginBloc>();
  }

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
          StreamBuilder(
              stream: loginBloc.stream,
              builder: (context, snapshot) {
                if (widget.title == "password".tr()) {
                  _textFieldController.value = _textFieldController.value
                      .copyWith(text: snapshot.data?.password.value);
                } else {
                  _textFieldController.value = _textFieldController.value
                      .copyWith(text: snapshot.data?.email.value);
                }
                return TextField(
                  controller: _textFieldController,
                  onChanged: (value) {
                    widget.onchanged(value);
                  },
                  obscureText:
                      widget.title == "password".tr() ? !_visible : false,
                  style:
                      const TextStyle(height: 1, fontStyle: FontStyle.normal),
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
                      borderSide:
                          const BorderSide(color: CustomColors.blueBorder),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: CustomColors.blueBorder),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(
                        color: CustomColors.gray,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w200),
                  ),
                );
              }),
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
