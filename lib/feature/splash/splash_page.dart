import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/resources/assets.dart';
import '../../core/resources/custom_colors.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: CustomColors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light
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
                  height: 150,
                  width: 150,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}