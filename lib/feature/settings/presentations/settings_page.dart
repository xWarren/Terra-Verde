import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/resources/assets.dart';
import '../../../core/resources/custom_colors.dart';
import '_components/bookmarks_section.dart';
import '_components/logout_section.dart';
import '_components/privacy_policy_section.dart';
import '_components/profile_section.dart';
import 'settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const expandedHeight = 250.0;
    const collapsedHeight = 60.0;
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: GetBuilder<SettingsController>( 
        builder: (context) {
          String base64String = controller.getPicture.call().split(',').last;
          List<int> bytes = base64.decode(base64String);
          Uint8List imageData = Uint8List.fromList(bytes);
          controller.update();
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: expandedHeight,
                collapsedHeight: collapsedHeight,
                floating: true,
                snap: true,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: CustomColors.primaryColor,
                  statusBarBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.light
                ),
                automaticallyImplyLeading: false,
                backgroundColor: CustomColors.white,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  centerTitle: true,
                  title: Obx(
                    () => Text(
                      "${controller.firstName.call()} ${controller.lastName.call()}",
                      style: const TextStyle(
                        color: CustomColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  background: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: expandedHeight - collapsedHeight - 50,
                          decoration: const BoxDecoration(
                            color: CustomColors.primaryColor
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: collapsedHeight + 20,
                        left: Get.width / 2 - 50,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(99),
                            child: imageData.isNotEmpty
                            ? Image.memory(
                              imageData,
                              height: 100,
                              width: 100,
                            )
                            : Image.asset(
                              Assets.logo,
                              height: 100,
                              width: 100,
                            )
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Settings",
                        style: TextStyle(
                          color: CustomColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    ProfileSection(onTap: controller.goToProfile),
                    BookmarksSection(onTap: controller.goToBookmark),
                    const PrivacyPolicySection(),
                    LogoutSection(onTap: controller.logout),
                    const SizedBox(height: 150)
                  ],
                ),
              )
            ],
          );
        }
      ),
    );
  }
}