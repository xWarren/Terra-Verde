import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/domain/entities/events_data_entity.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/utils/print_utils.dart';

class EventsPage extends StatefulWidget {
  final EventsDataEntity idEventsData;
  const EventsPage({
    super.key,
    required this.idEventsData
  });

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {

  String formattedMonth = "";
  String formattedTime = "";

  @override
  void initState() {
    String dateString = widget.idEventsData.eventDate;
    DateTime eventDate = DateTime.parse(dateString);

    DateFormat monthFormat = DateFormat('MMMM dd, yyyy');
    formattedMonth = monthFormat.format(eventDate);

    DateFormat timeFormat = DateFormat('hh:mma');
    formattedTime = timeFormat.format(eventDate);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.grey100,
      body: Stack(
        children: [
          Stack(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)
                    ),
                    child: Image.asset(
                      Assets.noImage,
                      fit: BoxFit.fill,
                      height: 290,
                      width: Get.width,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20
                      ),
                      decoration: ShapeDecoration(
                        color: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.idEventsData.eventName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: CustomColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            "$formattedMonth at $formattedTime",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: CustomColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: widget.idEventsData.eventDescription.isEmpty
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
                mainAxisAlignment: widget.idEventsData.eventDescription.isEmpty 
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      widget.idEventsData.eventDescription.isEmpty
                      ? "No description"
                      : widget.idEventsData.eventDescription,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: widget.idEventsData.eventDescription.isEmpty ? 14 : 13,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark
              ),
              leading: GestureDetector(
                onTap:  () => Get.back(),
                child: Container(
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD5D5D5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                      side: const BorderSide(
                        color: Colors.white,
                        width: 2
                      )
                    )
                  ),
                  child: Image.asset(Assets.icArrowLeftWhite)
                )
              ),
              actions: [
                GestureDetector(
                  onTap:  () => printUtil("Hello"),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD5D5D5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(99),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 2
                        )
                      )
                    ),
                    child: Image.asset(Assets.icAchiveAdd)
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}