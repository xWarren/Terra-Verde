import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/custom_colors.dart';
import 'officials_controller.dart';

class OfficialsPage extends GetView<OfficialsController> {
  const OfficialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: CustomColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => controller.getOfficials(),
            child: const Center(
              child: Text(
                "Officials Page",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}