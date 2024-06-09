import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/assets.dart';
import '../../resources/custom_colors.dart';
import '../../resources/dimensions.dart';

void showModal({
  required BuildContext context, 
  required String title, 
  required String description,
  required VoidCallback onTap,
  required String buttonText
}) {
   showModalBottomSheet(
    context: context, 
    backgroundColor: Colors.transparent,
    sheetAnimationStyle: AnimationStyle(
        duration: 500.milliseconds,
        curve: Curves.easeInOut
      ),
    isDismissible: false,
    enableDrag: false,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30)
    ),
    builder: (context) {
      return Stack(
        children: [
          Container(
            width: Get.width,
            height: 250,
              margin: const EdgeInsets.only(
                left: Dimensions.extraLargeSpacing,
                right: Dimensions.extraLargeSpacing,
                bottom: 90
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.extraLargeSpacing, 
                vertical: Dimensions.extraLargeSpacing
              ),
            decoration: ShapeDecoration(
              color: CustomColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              )
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    Assets.success,
                    height: 180,
                    width: 180,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: CustomColors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: CustomColors.grey500,
                    fontSize: 13,
                    fontWeight: FontWeight.w400
                  ),
                ),
                const SizedBox(height: Dimensions.smallSpacing),
                Expanded(
                  child: Container(
                    height: 50,
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(
                      horizontal: Dimensions.extraLargeSpacing
                    ),
                    child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          color: CustomColors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}