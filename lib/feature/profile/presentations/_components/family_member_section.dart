import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/domain/entities/residents_data_entity.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';
import '../../../../core/routes/routes.dart';

class FamilyMemberSection extends StatefulWidget {
  const FamilyMemberSection({
    super.key,
    required this.residentsData
  });

  final List<ResidentsDataEntity> residentsData;

  @override
  State<FamilyMemberSection> createState() => _FamilyMemberSectionState();
}

class _FamilyMemberSectionState extends State<FamilyMemberSection> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: Get.width,
               margin: const EdgeInsets.only(
                top: Dimensions.extraLargeSpacing
               ),
              decoration: const ShapeDecoration(
                color: CustomColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  )
                )
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.extraLargeSpacing,
                            vertical: Dimensions.extraLargeSpacing
                          ),
                          child: Text(
                            "Family Members",
                            style: TextStyle(
                              color: CustomColors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                            itemCount: widget.residentsData.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var data = widget.residentsData[index];
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
                                        ]
                                      ),
                                    )
                                  ]
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ]
              )
            ),
          )
        ]
      ),
    );
  }
}