import 'package:flutter/material.dart';
import 'package:wavy/utils/convertBase64Image.dart';

class CustomAvatar extends StatelessWidget{

  final String imageBase64;
  final bool isRoundCorner;
  final Size size;

  const CustomAvatar({
    Key? key,
    required this.imageBase64,
    this.isRoundCorner = false,
    this.size = const Size(70, 70)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: MemoryImage(convertBase64Image(imageBase64)),
          fit: BoxFit.contain
        ),
        borderRadius: isRoundCorner ? BorderRadius.circular(16.0) : null
      ),
    );
  }
}