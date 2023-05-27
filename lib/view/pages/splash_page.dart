import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:go_router/go_router.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/svg/CustomPaintIcon.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _navigatetologin();
  }

  _navigatetologin() async {
    _timer = await Future.delayed(const Duration(milliseconds: 3000), () {
      GoRouter.of(context).goNamed('loginPage');
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox.expand(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  CustomColors.blueTransparent,
                  CustomColors.blueLight
                ])),
            child: Center(
              child: CustomPaint(
                size: const Size(100, 74),
                painter: RPSCustomPainter(),
              ),
            )),
      ),
    );
  }
}
