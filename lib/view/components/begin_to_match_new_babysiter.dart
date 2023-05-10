import 'package:flutter/cupertino.dart';

import '../../utils/colors/custom_colors.dart';
import 'custom_card_infor.dart';
import 'custom_text.dart';

class BeginToMatchBabySister extends StatelessWidget {
  const BeginToMatchBabySister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        CustomText(
            title: "Begin to match new babysister",
            fontWeight: FontWeight.bold,
            fontSize: 16,
            lineHeight: 19 / 16,
            colorText: CustomColors.bluetext),
        SizedBox(
          height: 16,
        ),
        CustomCardInfor()
      ],
    );
  }
}
