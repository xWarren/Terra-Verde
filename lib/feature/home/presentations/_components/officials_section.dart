import 'package:flutter/material.dart';
import 'package:terra_verde/core/utils/print_utils.dart';

import '../../../../core/domain/entities/officials_data_entity.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';

class OfficialsSection extends StatefulWidget {
  const OfficialsSection({super.key});

  @override
  State<OfficialsSection> createState() => OfficialsSectionState();
}

class OfficialsSectionState extends State<OfficialsSection> with AutomaticKeepAliveClientMixin {

  List<OfficialsDataEntity> officialsData = [];

  OfficialsDataEntity? idOfficialsData;

  bool isLoading = false;

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }
  

  void addOfficialsData(List<OfficialsDataEntity> officials) {
    setState(() {
      officialsData.addAll(officials);
    });
  }

    void addIdOfficialsData(OfficialsDataEntity? officials) {
    setState(() {
      idOfficialsData = officials;
    });
  }

  @override
  Widget build(BuildContext context) {
    printUtil(officialsData.length);
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const SizedBox(height: Dimensions.largeSpacing),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Officials",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        const SizedBox(height: Dimensions.largeSpacing),
        SizedBox(
          height: 150,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: officialsData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var data = officialsData[index];
              return Container(
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: const Border.fromBorderSide(
                    BorderSide(color: CustomColors.primaryColor)
                  ),
                  image: const DecorationImage(
                    image: AssetImage(
                      Assets.noImage
                    ),
                    fit: BoxFit.fill     
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 8,
                        bottom: 20
                      ),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.75),
                            blurRadius: 40
                          )
                        ]
                      ),
                      child: Text(
                        data.name,
                        maxLines: 2,
                        style: const TextStyle(
                          color: CustomColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          ),
        )
      ],
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}