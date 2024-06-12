import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/presentation/custom/custom_back_button.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/custom_colors.dart';
import '../../../core/resources/dimensions.dart';
import 'announcement_controller.dart';

class AnnouncementPage extends GetView<AnnouncementController> {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        elevation: 0,
        leading: const CustomBackButton(),
        title: const Text(
          "Announcement Details",
          style: TextStyle(
            color: CustomColors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: CustomColors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: Dimensions.extraLargeSpacing),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    Assets.noImage,
                    height: 285,
                    width: 380,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.largeSpacing),
              Obx(
                () => Text(
                  controller.announcementName.call(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const SizedBox(height: Dimensions.smallSpacing),
              Text(
                "${controller.formattedMonth} • ${controller.formattedTime}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w400
                ),
              ),
              const SizedBox(height: Dimensions.extraLargeSpacing),
              const Text(
                "Description",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: Dimensions.extraLargeSpacing),
              Obx(
                () => Text(
                  controller.announcementDescription.call(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}