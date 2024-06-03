import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/domain/entities/announcement_data_entity.dart';
import '../../../../core/presentation/common/common_state.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';

class AnnouncementsSection extends StatefulWidget {
  const AnnouncementsSection({super.key});

  @override
  State<AnnouncementsSection> createState() => AnnouncementsSectionState();
}

class AnnouncementsSectionState extends State<AnnouncementsSection> with AutomaticKeepAliveClientMixin {
  
  List<AnnouncementDataEntity> announcementData = [];
  bool isLoading = false;

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }
  

  void addAnnouncementData(List<AnnouncementDataEntity> announcement) {
    setState(() {
      announcementData.addAll(announcement);
    });
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Announcements",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          ),
          announcementData.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: announcementData.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                var data = announcementData[index];
                String dateString = data.announcementDate;
                DateTime announcementDate = DateTime.parse(dateString);
                
                DateFormat monthFormat = DateFormat('MM DD, YYYYY');
                String formattedMonth = monthFormat.format(announcementDate);
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: const Border.fromBorderSide(
                      BorderSide(color: CustomColors.primaryColor)
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, .25),
                        blurRadius: 2,
                        offset: Offset(0, 1)
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(Assets.icCalendar),
                              Text(
                                formattedMonth,
                                style: const TextStyle(
                                  color: CustomColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
            })
          : const CommonState(
            title: "No Announcements",
            image: Assets.noAnnouncement,
            description: "There are no announcements at the moment. Check back later for updates.",
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text(
          //       "Announcements",
          //       style: TextStyle(
          //         color: CustomColors.black,
          //         fontSize: 14,
          //         fontWeight: FontWeight.w500
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () => printUtil("See All"),
          //       child: Row(
          //         children: [
          //           const Text(
          //             "See All",
          //             style: TextStyle(
          //               color: CustomColors.primaryColor,
          //               fontSize: 10,
          //               fontWeight: FontWeight.w500
          //             ),
          //           ),
          //           const SizedBox(width: Dimensions.regularSpacing),
          //           Image.asset(
          //             Assets.icArrowRight
          //           )
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          // Container(
          //   height: 115,
          //   margin: const EdgeInsets.only(top: Dimensions.regularSpacing),
          //   decoration: ShapeDecoration(
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12),
          //       side: const BorderSide(color: CustomColors.primaryColor)
          //     )
          //   ),
          // ),
        ],
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}