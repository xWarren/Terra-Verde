import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';

class LogoutSection extends StatelessWidget {
  
  const LogoutSection({
    super.key,
    required this.onTap
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 50,
        width: Get.width,
        margin: const EdgeInsets.only(
          left: 40,
          right: 40,
          top: 20
        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: CustomColors.red,
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Logout",
                style: TextStyle(
                  color: CustomColors.red,
                  fontSize: 13,
                  fontWeight: FontWeight.w500
                ),
              ),
              Image.asset(
                Assets.icRightLogout
              )
            ],
          ),
        ),
      ),
    );
  }
}