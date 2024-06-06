import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/presentation/custom/custom_back_button.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/custom_colors.dart';
import '../../../core/resources/dimensions.dart';
import '../../../core/routes/routes.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey200,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        elevation: 0,
        leading: const CustomBackButton(),
        title: const Text(
          "Profile",
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
      body: GetBuilder<ProfileController>(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: Get.width,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const ShapeDecoration(
                    color: CustomColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)
                      )
                    )
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 80),
                        child: Column(
                          mainAxisAlignment: controller.isLoading.value 
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                          children: [
                            controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator(color: CustomColors.primaryColor))
                            : Expanded(
                               child: ListView.builder(
                                itemCount: controller.residentsData.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var data = controller.residentsData[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                        Routes.profileInformationRoute,
                                        arguments: {'id': data.id}
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Container(
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
                                                        Assets.image,
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
                                                                data.firstName.isNotEmpty ? data.firstName : "N/A",
                                                                maxLines: 1,
                                                                overflow: TextOverflow.ellipsis,
                                                                style: const TextStyle(
                                                                  color: CustomColors.black,
                                                                  fontSize: 13,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                              const SizedBox(width: 3),
                                                              Text(
                                                                data.middleName.isNotEmpty ? data.middleName : "N/A",
                                                                maxLines: 1,
                                                                overflow: TextOverflow.ellipsis,
                                                                style: const TextStyle(
                                                                  color: CustomColors.black,
                                                                  fontSize: 13,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                              const SizedBox(width: 3),
                                                              Text(
                                                                data.lastName.isNotEmpty ? data.lastName : "N/A",
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
                                                          const SizedBox(height: Dimensions.largeSpacing),
                                                          Text(
                                                            data.relationship.isNotEmpty
                                                            ? data.relationship
                                                            : "N/A",
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: const TextStyle(
                                                              color: CustomColors.grey500,
                                                              fontSize: 13,
                                                              fontWeight: FontWeight.w500
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 30),
                                                child: Image.asset(Assets.icView),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: 20,
                        right: 20,
                        bottom: 20,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => Get.toNamed(Routes.addFamilyMemberRoute),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 0
                            ),
                            child: const Text(
                              "Add Family Member",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}