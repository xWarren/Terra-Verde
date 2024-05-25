import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/routes/routes.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.profileRoute),
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
              color: CustomColors.primaryColor,
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
                "Profile",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w500
                ),
              ),
              Image.asset(
                Assets.icRight
              )
            ],
          ),
        ),
      ),
    );
  }
}