import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/custom_colors.dart';
import '_components/event_sliver_appbar.dart';
import '_components/event_sliver_remaining.dart';
import 'events_controller.dart';

class EventsPage extends GetView<EventsController>  {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: 
      Obx(
        () => controller.isLoading.value
        ? const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(
                color: CustomColors.primaryColor,
              ),
            )
          ],
        )
        : CustomScrollView(
          slivers: [
            Obx( 
              () {
                bool isBookmarked = controller.checkIsBookmarked();
                return EventSliverAppBar(
                  bookmark: controller.bookmark,
                  isBookmarked: isBookmarked
                );
              }
            ),
            EventSliverRemaining(
              eventName: controller.eventName.call(), 
              formattedMonth: controller.formattedMonth, 
              formattedTime: controller.formattedTime, 
              eventDescription: controller.eventDescription.call(), 
              eventLocation: controller.eventLocation.call()
            ),
          ],
        ),
      )
    );
  }
}