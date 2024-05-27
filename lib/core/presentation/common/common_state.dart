import 'package:flutter/material.dart';

import '../../resources/custom_colors.dart';

class CommonState extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  const CommonState({
    super.key,
    required this.title,
    required this.image,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 120,
          width: 120,
        ),
        Text(
          title,
          style: const TextStyle(
            color: CustomColors.black,
            fontSize: 12,
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
              fontSize: 10,
              fontWeight: FontWeight.w400
            ),
          ),
        )
      ],
    );
  }
}