import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/resources/assets.dart';
import '../../../core/resources/custom_colors.dart';
import 'officials_controller.dart';

class OfficialsPage extends GetView<OfficialsController> {
  const OfficialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: CustomColors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Officials",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GetBuilder<OfficialsController>(
          builder: (context) {
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.officialsData.length,
                itemBuilder: (context, index) {
                  var data = controller.officialsData[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: CustomColors.primaryColor
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: data.image.isNotEmpty
                                  ? Image.network(
                                    data.image,
                                    height: 86,
                                    width: 86,
                                  )
                                  : Image.asset(
                                    Assets.noImage,
                                    height: 86,
                                    width: 86,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      data.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: CustomColors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    Text(
                                      data.position,
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
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }
        )
      ],
    );
  }
}