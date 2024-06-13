import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/domain/entities/officials_data_entity.dart';
import '../../../../core/presentation/common/common_state.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';
import 'officials_shimmer.dart';

class OfficialsSection extends StatefulWidget {
  const OfficialsSection({super.key});

  @override
  State<OfficialsSection> createState() => OfficialsSectionState();
}

class OfficialsSectionState extends State<OfficialsSection> with AutomaticKeepAliveClientMixin {

  List<OfficialsDataEntity> officialsData = [];

  OfficialsDataEntity? idOfficialsData;

  bool isLoading = true;

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }
  

  void addOfficialsData(List<OfficialsDataEntity> officials) {
    setState(() {
      officialsData.assignAll(officials);
    });
  }

    void addIdOfficialsData(OfficialsDataEntity? officials) {
    setState(() {
      idOfficialsData = officials;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [ 
        const SizedBox(height: Dimensions.largeSpacing),
        isLoading == true
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: OfficialsShimmer(isLoading: isLoading),
        )
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          const SizedBox(height: Dimensions.largeSpacing),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Officials",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            const SizedBox(height: Dimensions.largeSpacing),
            officialsData.isEmpty
            ? const CommonState(
              title: "No Official",
              image: Assets.noAnnouncement,
              height: 120,
              width: 120,
              description: "There are no official at the moment. Check back later for updates.",
            )
            : SizedBox(
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: officialsData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var data = officialsData[index];
                    return Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          foregroundDecoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.transparent, Colors.black54],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.5, 1],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            Assets.logo,
                            height: 120,
                            width: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  data.name.isEmpty
                                  ? "No name"
                                  : data.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: CustomColors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            const SizedBox(height: 100),
          ],
        ),
      ],
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}