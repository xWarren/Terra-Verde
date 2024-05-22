import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '_components/dashboard_bottom_navigation.dart';
import 'dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
     return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: AnimatedBuilder(
          animation: controller.scrollListener,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: controller.navigationItems
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: controller.scrollListener.bottom,
                  child: Obx(
                    () => DashBoardBottomNavigation(
                      tabController: controller.tabController,
                      index: controller.pageIndex.value, 
                      onTapped: controller.tapNavigation,
                    )
                  )
                )
              ],
            );
          }
        ),
      )
    );
  }
}
