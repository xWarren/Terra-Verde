import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/resources/custom_colors.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Home Page",
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