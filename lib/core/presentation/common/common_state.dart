import 'package:flutter/material.dart';

import '../../resources/custom_colors.dart';

class CommonState extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final double height;
  final double width;

  const CommonState({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.height,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            image,
            height: height,
            width: width,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: CustomColors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: CustomColors.grey400,
              fontSize: 13,
              fontWeight: FontWeight.w400
            ),
          ),
        )
      ],
    );
  }
}