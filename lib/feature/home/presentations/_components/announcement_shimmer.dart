import 'package:flutter/material.dart';

import '../../../../core/presentation/common/common_shimmer.dart';
import '../../../../core/resources/dimensions.dart';

class AnnouncementShimmer extends StatefulWidget {

  const AnnouncementShimmer({
    super.key,
    required this.isLoading
  });

  final bool isLoading;

  @override
  State<AnnouncementShimmer> createState() => _AnnouncementShimmerState();
}

class _AnnouncementShimmerState extends State<AnnouncementShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CommonShimmer(
            showShimmer: widget.isLoading,
            height: 20,
            width: MediaQuery.of(context).size.width / 3.2,
          ),
          const SizedBox(height: Dimensions.largeSpacing),
          SizedBox(
            height: 150,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(2, (index){
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: Dimensions.largeSpacing),
                  child: CommonShimmer(
                    showShimmer: widget.isLoading,
                    height: 150,
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: Dimensions.regularSpacing)
        ]
      ),
    );
  }
}