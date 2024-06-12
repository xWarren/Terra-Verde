import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';

class EventSliverAppBar extends SliverAppBar {
  EventSliverAppBar({
    super.key,
    required this.bookmark,
    required this.isBookmarked
  }) : super(
    elevation: 0,
    expandedHeight: 200.0,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark
    ),
    leading: GestureDetector(
      onTap: () => Get.back(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(99),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4
              )
            ]
          ),
          child: Image.asset(
            Assets.icArrowLeft,
            height: 24,
            width: 24,
          ),
        ),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: bookmark,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 40,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: CustomColors.white,
              borderRadius: BorderRadius.circular(99),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 4),
                  blurRadius: 4
                )
              ]
            ),
            child: Image.asset(
              isBookmarked ? Assets.icArchiveRemove : Assets.icAchiveAdd,
              height: 24,
              width: 24,
            ),
          ),
        ),
      )
    ],
    flexibleSpace: FlexibleSpaceBar(
      background: Image.asset(
        Assets.noImage,
        fit: BoxFit.fill,
      ),
    ),
  );

  final VoidCallback bookmark;
  final bool isBookmarked;
}