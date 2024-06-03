import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/domain/entities/events_data_entity.dart';
import '../../../../core/presentation/common/common_button.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';

class EventsSection extends StatefulWidget {
  final Function({required int id}) getIdFromEvents;
  const EventsSection({
    super.key,
    required this.getIdFromEvents
  });

  @override
  State<EventsSection> createState() => EventsSectionState();
}

class EventsSectionState extends State<EventsSection> with AutomaticKeepAliveClientMixin {

  List<EventsDataEntity> eventsData = [];
  EventsDataEntity? idEventsData;
  bool isLoading = false;

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }
  

  void addEventsData(List<EventsDataEntity> events) {
    setState(() {
      eventsData.addAll(events);
    });
  }

    void addIdEventsData(EventsDataEntity? events) {
    setState(() {
      idEventsData = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: Dimensions.largeSpacing),
          const Text(
            "Events",
            style: TextStyle(
              color: CustomColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
          ),
          isLoading 
          ? const Center(child: CircularProgressIndicator(color: CustomColors.primaryColor))
          : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: eventsData.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var data = eventsData[index];
              String dateString = data.eventDate;
              DateTime eventDate = DateTime.parse(dateString);
          
              DateFormat monthFormat = DateFormat('MMMM');
              String formattedMonth = monthFormat.format(eventDate);
          
              DateFormat dayFormat = DateFormat('d');
              String formattedDay = dayFormat.format(eventDate);
          
          
              DateFormat timeFormat = DateFormat('h:mma');
              String formattedTime = timeFormat.format(eventDate).toLowerCase();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: CustomColors.primaryColor)
                        )
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: data.eventImage.isNotEmpty
                              ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 86,
                                    width: 86,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 3,
                                          color: CustomColors.blackOpacity,
                                          spreadRadius: 99,
                                          offset: Offset(0, 2)
                                        )
                                      ],
                                      image: DecorationImage(
                                        image: NetworkImage(data.eventImage),
                                        opacity: 0.5,
                                        fit: BoxFit.fill
                                      )
                                    ),
                                    child: Image.network(
                                      data.eventImage,
                                      height: 86,
                                      width: 86,
                                      opacity: const AlwaysStoppedAnimation(.5),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        formattedMonth,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: CustomColors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400
                                        ),
                                      ),
                                      Text(
                                        formattedDay,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: CustomColors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500
                                        )
                                      ),
                                    ],
                                  )
                                ],
                              )
                              : Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 86,
                                    width: 86,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          color: CustomColors.blackOpacity,
                                          spreadRadius: 99,
                                          offset: Offset(0, 2)
                                        )
                                      ],
                                      image: DecorationImage(
                                        image: AssetImage(Assets.noImage),
                                        opacity: 0.5,
                                        fit: BoxFit.fill
                                      )
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        formattedMonth,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: CustomColors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400
                                        ),
                                      ),
                                      Text(
                                        formattedDay,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          color: CustomColors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500
                                        )
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.regularSpacing),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    data.eventName,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: CustomColors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  const SizedBox(height: Dimensions.doubleExtraLargeSpacing),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            "Event Start:",
                                            style: TextStyle(
                                              color: CustomColors.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500
                                            ),
                                          ),
                                          const SizedBox(width: Dimensions.smallSpacing),
                                          Text(
                                            formattedTime,
                                            style: const TextStyle(
                                              color: CustomColors.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                      CommonButton(
                                        isLoading: false,
                                        onPressed: () =>  widget.getIdFromEvents(id: data.id),
                                        width: 80,
                                        height: 27,
                                        text: "View",
                                        textStyle: const TextStyle(
                                          color: CustomColors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w700
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: Dimensions.regularSpacing),
                                ],
                              ),
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
        ],
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}