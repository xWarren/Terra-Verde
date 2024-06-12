import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/presentation/common/common_shimmer.dart';
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
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
             backgroundColor: CustomColors.white,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: CustomColors.white,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark
              ),
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: controller.isLoading.value
                  ? CommonShimmer(
                    showShimmer: controller.isLoading.value,
                    width: 50,
                    height: 20,
                  )
                  : const Text(
                    "Home",
                    style: TextStyle(
                      color: CustomColors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Obx(
                      () => AnnouncementsSection(
                        key: controller.announcementSectionKey,
                        logout: controller.logout,
                        onPageChanged: controller.onPageChanged,
                        currentPageIndex: controller.currentPageIndex.call(),   
                      ),
                    ),
                    EventsSection(
                      key: controller.eventSectionKey, 
                      getIdFromEvents: controller.getIdFromEvents
                    ),
                    OfficialsSection(
                      key: controller.officialsSectionKey
                    ) 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}