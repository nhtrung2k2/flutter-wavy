import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wavy/view/pages/baby_sister_detail.dart';

class CustomCardInfor extends StatelessWidget {
  const CustomCardInfor({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), //<-- SEE HERE
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [ColumnInfor()],
        ),
      ),
    );
  }
}
