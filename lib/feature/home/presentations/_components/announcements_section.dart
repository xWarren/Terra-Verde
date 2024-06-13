import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/domain/entities/announcement_data_entity.dart';
import '../../../../core/presentation/common/common_state.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';
import 'announcement_shimmer.dart';

class AnnouncementsSection extends StatefulWidget {
  
  const AnnouncementsSection({
    super.key,
    required this.logout,
    required this.onPageChanged,
    required this.currentPageIndex,
    required this.getIdFromAnnouncement
    });

  final VoidCallback logout;
  final Function(int) onPageChanged;
  final int currentPageIndex;
  final Function(int) getIdFromAnnouncement;

  @override
  State<AnnouncementsSection> createState() => AnnouncementsSectionState();
}

class AnnouncementsSectionState extends State<AnnouncementsSection> with AutomaticKeepAliveClientMixin {
  
  List<AnnouncementDataEntity> announcementData = [];
  bool isLoading = true;

  String errorMessage = "";

  void setErrorMessage(String value) {
    setState(() {
      errorMessage = value;
    });
  }

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }
  

  void addAnnouncementData(List<AnnouncementDataEntity> announcement) {
    setState(() {
      announcementData.assignAll(announcement);
    });
  }

  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return isLoading == true
    ? Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AnnouncementShimmer(
        isLoading: isLoading,
      ),
    )
    :  Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             const Padding(
               padding: EdgeInsets.symmetric(horizontal: 20),
               child: Text(
                 "Announcements",
                 style: TextStyle(
                   color: CustomColors.black,
                   fontSize: 20,
                   fontWeight: FontWeight.w500
                 ),
               ),
             ),
             const SizedBox(height: Dimensions.largeSpacing),
             announcementData.isEmpty
             ? const CommonState(
              title: "No Announcement",
              image: Assets.noAnnouncement,
              height: 120,
              width: 120,
              description: "There are no announcements at the moment. Check back later for updates.",
             )
             : SizedBox(
               height: 150,
               child: PageView.builder(
                 itemCount: announcementData.length,
                 onPageChanged: widget.onPageChanged,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context, index) {
                   var data = announcementData[index];
                   String dateString = data.announcementDate;
                   DateTime announcementDate = DateTime.parse(dateString);
                   
                   DateFormat monthFormat = DateFormat('MMMM dd, yyyy');
                   String formattedMonth = monthFormat.format(announcementDate);
                   return GestureDetector(
                    onTap: () => widget.getIdFromAnnouncement(data.id),
                     child: Container(
                       margin: const EdgeInsets.symmetric(horizontal: 20),
                       padding: const EdgeInsets.symmetric(
                         horizontal: Dimensions.largeSpacing,
                         vertical: Dimensions.largeSpacing
                       ),
                       decoration: BoxDecoration(
                         color: CustomColors.white,
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
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         mainAxisSize: MainAxisSize.max,
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Expanded(
                                 child: Text(
                                   data.announcementName,
                                   maxLines: 1,
                                   overflow: TextOverflow.ellipsis,
                                   style: const TextStyle(
                                     color: CustomColors.black,
                                     fontSize: 16,
                                     fontWeight: FontWeight.bold
                                   ),
                                 ),
                               ),
                               const SizedBox(width: Dimensions.regularSpacing),
                               Row(
                                 children: [
                                   Image.asset(
                                     Assets.icCalendar,
                                     height: 18,
                                     width: 18
                                   ),
                                   const SizedBox(width: Dimensions.smallSpacing),
                                   Text(
                                     formattedMonth,
                                     style: const TextStyle(
                                       color: CustomColors.black,
                                       fontSize: 14,
                                       fontWeight: FontWeight.w500
                                     ),
                                   )
                                 ],
                               ),
                             ],
                           ),
                           const SizedBox(height: Dimensions.extraLargeSpacing),
                           Expanded(
                             child: Text(
                               data.announcementDescription,
                               maxLines: 2,
                               overflow: TextOverflow.ellipsis,
                               textAlign: TextAlign.left,
                               style: const TextStyle(
                                 color: CustomColors.black,
                                 fontSize: 16,
                                 fontWeight: FontWeight.w600
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   );
                 }
               ),
             ),
            const SizedBox(height: 20),
          ],
        ),
        announcementData.isNotEmpty
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              announcementData.length, 
              (index) => Flexible(
                child: Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: widget.currentPageIndex == index
                    ? CustomColors.primaryColor
                    : CustomColors.grey100,
                    shape: BoxShape.circle
                  ),
                ),
              ),
            )
          ),
        )
        : const SizedBox.shrink()
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}