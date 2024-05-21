import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              "Login Page",
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