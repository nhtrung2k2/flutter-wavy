import 'package:flutter/material.dart';

class CustomRowDevide extends StatelessWidget {
  final Widget firstChild;
  final Widget secondChild;
  const CustomRowDevide(
      {super.key, required this.firstChild, required this.secondChild});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [firstChild, secondChild],
      ),
      const Divider(),
    ]);
  }
}
