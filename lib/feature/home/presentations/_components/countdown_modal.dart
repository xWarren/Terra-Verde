import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';

class CountdownModal extends StatefulWidget {

  const CountdownModal({
    super.key, 
    required this.errorMessage, 
    required this.secondsRemaining
  });

  final String errorMessage;
  final int secondsRemaining;

  @override
  CountdownModalState createState() => CountdownModalState();
}

class CountdownModalState extends State<CountdownModal> {
  late int secondsRemaining;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    secondsRemaining = widget.secondsRemaining;
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Get.width,
          height: 70,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.regularSpacing, 
            vertical: Dimensions.smallSpacing
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                widget.errorMessage,
                style: const TextStyle(
                  color: CustomColors.red,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Dimensions.regularSpacing),
              Text(
                "You will be logged out in $secondsRemaining seconds.",
                style: const TextStyle(
                  color: CustomColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}