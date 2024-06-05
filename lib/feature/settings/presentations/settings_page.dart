import 'package:flutter/material.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: expandedHeight,
            collapsedHeight: collapsedHeight,
            floating: true,
            snap: true,
            automaticallyImplyLeading: false,
            backgroundColor: CustomColors.white,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: true,
              title: const Text(
                "Gavino T. Caro",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600
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
                    bottom: collapsedHeight + 30,
                    left: MediaQuery.of(context).size.width / 2 - 50,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: Image.asset(
                          Assets.image,
                          height: 100,
                          width: 100,
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
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
                ProfileSection(),
                BookmarksSection(),
                PrivacyPolicySection(),
                LogoutSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}