import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/resources/custom_colors.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Profile Page",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 30,
                fontWeight: FontWeight.w500
              ),
            ),
          )
        ],
      ),
    );
  }
}