import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/resources/assets.dart';
import '../../core/resources/custom_colors.dart';
import 'events_controller.dart';

class EventsPage extends GetView<EventsController>  {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey100,
      body: Stack(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)
                ),
                child: Image.asset(
                  Assets.noImage,
                  fit: BoxFit.fill,
                  height: 290,
                  width: Get.width,
                ),
              ),
              Positioned(
                top: 250,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          controller.eventName.call(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: CustomColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      Text(
                        "${controller.formattedMonth} at ${controller.formattedTime}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: CustomColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Center(
                  child: Text(
                    controller.eventDescription.isEmpty
                    ? "No description"
                    : controller.eventDescription.call(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: controller.eventDescription.isEmpty ? 14 : 13,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark
              ),
              leading: GestureDetector(
                onTap:  () => Get.back(),
                child: Container(
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD5D5D5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                      side: const BorderSide(
                        color: Colors.white,
                        width: 2
                      )
                    )
                  ),
                  child: Image.asset(Assets.icArrowLeftWhite)
                )
              ),
              actions: [
                GestureDetector(
                  onTap:  () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD5D5D5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(99),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 2
                        )
                      )
                    ),
                    child: Image.asset(Assets.icAchiveAdd)
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}