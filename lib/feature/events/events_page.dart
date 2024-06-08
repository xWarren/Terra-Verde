import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/resources/custom_colors.dart';
import 'events_controller.dart';

class EventsPage extends GetView<EventsController>  {
  const EventsPage({super.key});

   // String formattedMonth = "";
  // String formattedTime = "";

  // @override
  // void initState() {
  //   String dateString = widget.idEventsData.eventDate;
  //   DateTime eventDate = DateTime.parse(dateString);

  //   DateFormat monthFormat = DateFormat('MMMM dd, yyyy');
  //   formattedMonth = monthFormat.format(eventDate);

  //   DateFormat timeFormat = DateFormat('hh:mma');
  //   formattedTime = timeFormat.format(eventDate);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColors.grey100,
      body: Column(
        children: [
          Text("Hello")
        ],
      )
    );
  }
}