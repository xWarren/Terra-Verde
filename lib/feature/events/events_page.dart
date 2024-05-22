import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/resources/custom_colors.dart';
import 'events_controller.dart';

class EventsPage extends GetView<EventsController> {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Events Page",
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