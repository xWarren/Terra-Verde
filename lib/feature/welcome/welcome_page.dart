import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'welcome_controller.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              "Welcome Page",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25
              ),
            ),
          )
        ],
      ),
    );
  }
}