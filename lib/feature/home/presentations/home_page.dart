import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/resources/custom_colors.dart';
import '_components/announcements_section.dart';
import '_components/events_section.dart';
import '_components/officials_section.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          const SliverAppBar(
           backgroundColor: CustomColors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: CustomColors.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark
            ),
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Padding(
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
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnnouncementsSection(
                  key: controller.announcementSectionKey,
                ),
                EventsSection(
                  key: controller.eventSectionKey, 
                  getIdFromEvents: controller.getIdFromEvents
                ),
                OfficialsSection(
                  key: controller.officialsSectionKey
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}