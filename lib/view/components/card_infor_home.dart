import 'package:flutter/material.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/resize.dart';

class CardInforHome extends StatelessWidget {
  final String avatar;
  final String name;
  final String age;
  final String city;
  final Function onPressed;
  const CardInforHome(
      {super.key,
      required this.avatar,
      required this.name,
      required this.age,
      required this.city,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        elevation: 16,
        shadowColor: CustomColors.grayShadow,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.network(
              avatar,
              width: 64,
              height: 64,
            ),
            SizedBox(width: 10.resizewidth(context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: CustomColors.blueTextDark,
                      fontSize: 14,
                      height: (16 / 14),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.resizeheight(context)),
                Text(
                  age,
                  style: const TextStyle(
                      color: CustomColors.grayLight,
                      fontSize: 14,
                      fontFamily: "Roboto",
                      height: (16 / 14),
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 4.resizeheight(context)),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "$city city",
                    style: const TextStyle(
                        color: CustomColors.blackLight,
                        fontSize: 14,
                        height: (16 / 14),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
