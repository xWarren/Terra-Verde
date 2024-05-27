import 'package:flutter/material.dart';

import '../../../../core/presentation/common/common_state.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';

class AnnouncementsSection extends StatelessWidget {
  const AnnouncementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
        top: 50
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Announcements",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          ),
          CommonState(
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
}