import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String nameTitle;
  final bool haveBackButton;
  final Color textColor;
  final Color backgroundColorAppBar;
  const CustomAppBar(
      {super.key,
      required this.nameTitle,
      required this.haveBackButton,
      required this.textColor,
      required this.backgroundColorAppBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: haveBackButton,
      centerTitle: true,
      leading: haveBackButton
          ? IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios),
              iconSize: 20.0,
              onPressed: () {
                GoRouter.of(context).pop();
              },
            )
          : null,
      title: Text(
        nameTitle,
        style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: backgroundColorAppBar,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
