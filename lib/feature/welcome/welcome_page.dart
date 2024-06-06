import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/resources/assets.dart';
import '../../core/resources/custom_colors.dart';
import '../../core/resources/dimensions.dart';
import 'welcome_controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: CustomColors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Hero(
                tag: "logo",
                child: Image.asset(
                  Assets.logo,
                  height: 160,
                  width: 160,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: Dimensions.regularSpacing),
            const Text(
              "Welcome to\n TRIMS Neighbor",
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              height: 50,
              width: Get.width,
              margin: const EdgeInsets.symmetric(
                horizontal: Dimensions.extraLargeSpacing,
                vertical: Dimensions.extraLargeSpacing
              ),
              child: ElevatedButton(
                onPressed: () => controller.headFamilyLogin(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  elevation: 0
                ),
                child: const Text(
                  "Login as head of the family",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: Get.width,
              margin: const EdgeInsets.symmetric(
                horizontal: Dimensions.extraLargeSpacing
              ),
              child: ElevatedButton(
                onPressed: () => controller.familyMemberLogin(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: CustomColors.primaryColor)
                  ),
                  elevation: 0
                ),
                child: const Text(
                  "Login as family member",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: CustomColors.primaryColor
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}