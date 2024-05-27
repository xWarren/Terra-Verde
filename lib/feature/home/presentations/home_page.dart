import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/resources/custom_colors.dart';
import '../../../core/resources/dimensions.dart';
import '_components/announcements_section.dart';
import '_components/events_section.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: CustomColors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Home",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        color: CustomColors.white,
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
          ),
        children: [
          const AnnouncementsSection(),
          const SizedBox(height: Dimensions.largeSpacing),
          EventsSection(
            key: controller.eventSectionKey, 
            eventsData: controller.eventsData,
            getIdFromEvents: controller.getIdFromEvents,
          )
        ],
      ),
    ),
  );
 }
}