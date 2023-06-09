import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wavy/event/login_event.dart';
import 'package:wavy/state/login_state.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/svg/CustomPaintIcon.dart';
import 'package:wavy/view/components/custom_button.dart';
import 'package:wavy/view/components/loadingOverlay.dart';
import '../../bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as devtool;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    void _showErrorDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(
                "The email or password you entered is incorrect. Please try again."),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.fromLTRB(40, 159.5, 40, 0),
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.formStatus ==
                    FormSubmissionStatus.submissionsuccess) {
                  LoadingOverlay.hide();
                  context.goNamed('homePage');
                } else if (state.formStatus ==
                    FormSubmissionStatus.submissionfailed) {
                  LoadingOverlay.hide();
                  _showErrorDialog();
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
  LoginForm({super.key});

  List<String> languageimages = const [
    "assets/images/england-flag.png",
    "assets/images/japan-flag.png",
    "assets/images/vietnam-flag.png"
  ];

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
      const SizedBox(height: 23.25),
      CustomInput(
          title: "Email",
          hintText: "Enter email",
          inputType: TextInputType.emailAddress,
          validator: validate,
          onchanged: (value) {
            if (value != null) {
              bloc.add(LoginEmailChanged(email: value));
            }
          }),
      const SizedBox(height: 23.25),
      CustomInput(
          title: "Password",
          hintText: "Text",
          inputType: TextInputType.visiblePassword,
          validator: validate,
          onchanged: (value) {
            if (value != null) {
              bloc.add(LoginPasswordChanged(password: value));
            }
          }),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomTextButton(content: "Forgot password?", onPressed: () {})
        ],
      ),
      const SizedBox(height: 8),
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
        title: "Login",
        horizontal: 50,
        vertical: 10,
      ),
      const SizedBox(height: 16),
      CustomTextButton(
        content: "Create new account",
        onPressed: () {},
      ),
      SizedBox(
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: languageimages.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: Image.asset(
                        languageimages[index],
                      ));
                }),
          ],
        ),
      )
    ]));
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
        const SizedBox(height: 8),
        Stack(alignment: Alignment.topRight, children: [
          TextField(
            onChanged: (value) {
              widget.onchanged(value);
            },
            obscureText: widget.title == "Password" ? !_visible : false,
            style: const TextStyle(height: 1, fontStyle: FontStyle.normal),
            keyboardType: widget.inputType,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              errorText: widget.validator(),
              suffixIconConstraints:
                  const BoxConstraints(minHeight: 16, minWidth: 16),
              isCollapsed: true,
              contentPadding: widget.title == "Password"
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
          widget.title == "Password"
              ? togglePassword()
              : const SizedBox(
                  width: 0,
                )
        ]),
      ],
    );
  }
}
