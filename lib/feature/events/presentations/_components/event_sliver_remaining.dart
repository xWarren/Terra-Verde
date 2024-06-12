import 'package:flutter/material.dart';

import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';

class EventSliverRemaining extends StatefulWidget {
  const EventSliverRemaining({
    super.key,
    required this.eventName,
    required this.formattedMonth,
    required this.formattedTime,
    required this.eventDescription,
    required this.eventLocation
  });

  final String eventName;
  final String formattedMonth;
  final String formattedTime;
  final String eventDescription;
  final String eventLocation;

  @override
  State<EventSliverRemaining> createState() => _EventSliverRemainingState();
}

class _EventSliverRemainingState extends State<EventSliverRemaining> {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.eventName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(top: Dimensions.regularSpacing),
                        decoration: ShapeDecoration(
                          color: CustomColors.grey200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                        ),
                        child: Image.asset(
                          Assets.icCalendar,
                          height: 15,
                          width: 15,
                          color: CustomColors.primaryColor,
                        ),
                      ),
                      const SizedBox(width: Dimensions.smallSpacing),
                      Text(
                        "${widget.formattedMonth} at ${widget.formattedTime}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(top: Dimensions.regularSpacing),
                        decoration: ShapeDecoration(
                          color: CustomColors.grey200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                        ),
                        child: Image.asset(
                          Assets.icLocation,
                          color: CustomColors.primaryColor
                        ),
                      ),
                      const SizedBox(width: Dimensions.smallSpacing),
                      Text(
                        widget.eventLocation.isEmpty
                        ? "No set location"
                        : widget.eventLocation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.doubleExtraLargeSpacing),
                  const Text(
                    "Description",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: Dimensions.extraLargeSpacing),
                  Text(
                    widget.eventDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}