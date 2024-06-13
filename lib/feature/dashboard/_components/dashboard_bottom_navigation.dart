import 'package:flutter/material.dart';
import 'package:terra_verde/core/utils/extensions/int_extension.dart';

import '../../../core/presentation/custom/custom_circle_tab_indicator.dart';
import '../../../core/resources/custom_colors.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/dimensions.dart';
import '../../../core/utils/enums/tab_type.dart';


class DashBoardBottomNavigation extends StatelessWidget {
  const DashBoardBottomNavigation({
    super.key,
    required this.tabController,
    required this.index,
    required this.onTapped,
  });

  final TabController? tabController;
  final int index;
  final Function(int) onTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      height: 70.0,
      margin: const EdgeInsets.only(
        left: 25, 
        right: 25, 
        bottom: 40
      ),
      decoration: ShapeDecoration(
        color: CustomColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: const BorderSide(
            color: CustomColors.grey400,
            width: 1
          ),
        ),
      ),
      child: TabBar(
        onTap: onTapped,
        controller: tabController,
        labelColor: CustomColors.primaryColor,
        unselectedLabelColor: Colors.grey,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: CircleTabIndicator(color: CustomColors.primaryColor, radius: 3),
        labelStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 12.0),
        tabs:  [
          Tab(
            icon: Image.asset(
              index.toTabType() == TabType.home ? Assets.icHomeSelected : Assets.icHomeUnselected,
              width: 24, 
              height: 24
            ),
            iconMargin: const EdgeInsets.symmetric(vertical: Dimensions.smallSpacing),
          ),
          Tab(
            icon: Image.asset(
              index.toTabType() == TabType.settings ? Assets.icSettingsSelected : Assets.icSettingsUnselected, 
              width: 24, 
              height: 24
            ),
            iconMargin: const EdgeInsets.symmetric(vertical: Dimensions.smallSpacing),
          )
        ],
      ),
    );
  }
}