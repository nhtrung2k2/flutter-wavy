import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget{

  final String imageUrl;
  final bool isRoundCorner;
  final Size size;

  const CustomAvatar({
    Key? key,
    required this.imageUrl,
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
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover
        ),
        borderRadius: isRoundCorner ? BorderRadius.circular(16.0) : null
      ),
    );
  }
}