import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/resources/custom_colors.dart';
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
                "Gavino Caro",
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
                      child: const CircleAvatar(
                        backgroundImage:NetworkImage(
                          'https://picsum.photos/256'
                        ),
                        radius: 45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverFillRemaining(
            hasScrollBody: true,
            fillOverscroll: true,
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
                ProfileSection()
              ],
            ),
          )
        ],
      ),
    );
  }
}