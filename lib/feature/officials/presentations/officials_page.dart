import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'officials_controller.dart';

class OfficialsPage extends GetView<OfficialsController> {
  const OfficialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Officials Page",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}