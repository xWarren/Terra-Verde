import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/presentation/custom/custom_back_button.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/custom_colors.dart';
import '../../../core/resources/dimensions.dart';
import 'bookmarks_controller.dart';

class BookmarksPage extends GetView<BookmarksController> {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        elevation: 0,
        leading: const CustomBackButton(),
        title: const Text(
          "Bookmark",
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
      body: Obx(
        () => controller.isLoading.value
        ? const Center(child: CircularProgressIndicator(color: CustomColors.primaryColor))
        : ListView.builder(
          itemCount: controller.bookmarkData.call().length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            var data = controller.bookmarkData[index];
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10
              ),
              decoration: ShapeDecoration(
                color: CustomColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: CustomColors.primaryColor)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const SizedBox(width: Dimensions.regularSpacing),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(99),
                          child: Image.asset(
                            Assets.logo,
                            height: 64,
                            width: 64
                          ),
                        ),
                        const SizedBox(width: Dimensions.extraLargeSpacing),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                children: [
                                  Text(
                                   data.eventName.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: CustomColors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            );
          },
        ),
      ),
    );
  }
}