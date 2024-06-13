import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/domain/entities/resident_house_member_data_entity.dart';
import '../../../../core/presentation/common/common_state.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';
import '../../../../core/routes/routes.dart';

class FamilyMemberSection extends StatefulWidget {
  const FamilyMemberSection({
    super.key,
    required this.residentsData,
    required this.deleteResidentHouseMember,
    required this.isHeadFamily,
    required this.getId
  });

  final List<ResidentHouseMemberDataEntity> residentsData;
  final Function({required int id}) deleteResidentHouseMember;
  final bool isHeadFamily;
  final String getId;

  @override
  State<FamilyMemberSection> createState() => _FamilyMemberSectionState();
}

class _FamilyMemberSectionState extends State<FamilyMemberSection> {

  late List<ResidentHouseMemberDataEntity> _residentHouseMemberData;

  late bool isHeadFamily;

  @override
  void initState() {
    super.initState();
    _residentHouseMemberData = widget.residentsData;
    isHeadFamily = widget.isHeadFamily;
    _sortFamilyMembers();
  }

  void _sortFamilyMembers() {
    _residentHouseMemberData.sort((a, b) {
      List<String> order = ['Grandmother', 'Grandfather', 'Mother', 'Brother', 'Sister'];
      int indexA = order.indexOf(a.relationship);
      int indexB = order.indexOf(b.relationship);
      if (indexA == -1  ) indexA = order.length;
      if (indexB == -1) indexB = order.length;
      return indexA.compareTo(indexB);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Family Member",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        _residentHouseMemberData.isEmpty
        ? const CommonState(
          title: "No Family Member Found", 
          image: Assets.noData, 
          height: 240,
          width: 240,
          description: "Please add family member to see listed here."
        )
        : ListView.builder(
          itemCount: _residentHouseMemberData.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var data = _residentHouseMemberData[index];
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
                        if(isHeadFamily == true)
                        GestureDetector(
                          onTap: () => widget.deleteResidentHouseMember(id: data.id),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Icon(
                              Icons.delete,
                              color: CustomColors.red,
                              size: 24
                            )
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
        const SizedBox(height: 100)
      ],
    );
  }
}