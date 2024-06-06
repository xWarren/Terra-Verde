import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:intl/intl.dart';

import '../../../../core/domain/entities/announcement_data_entity.dart';
import '../../../../core/presentation/common/common_state.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import 'countdown_modal.dart';

class AnnouncementsSection extends StatefulWidget {
  
  const AnnouncementsSection({
    super.key,
    required this.logout
    });

  final VoidCallback logout;

  @override
  State<AnnouncementsSection> createState() => AnnouncementsSectionState();
}

class AnnouncementsSectionState extends State<AnnouncementsSection> with AutomaticKeepAliveClientMixin {
  
  List<AnnouncementDataEntity> announcementData = [];
  bool isLoading = false;

  String errorMessage = "";

  Timer? countdownTimer;
  int secondsRemaining = 0;

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
      announcementData.addAll(announcement);
    });
  }

  @override
  void initState() {
    Future.delayed(
      3.seconds,
      () {
        if (errorMessage.contains("User not found")) {
          setState(() {
            secondsRemaining = 5;
          });
          _startCountdown();
          showProductModal(context);
        }
      }
    );
    super.initState();
  }

  void _startCountdown() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer.cancel();
        widget.logout();
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
          ListView.builder(
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
              return  announcementData.isEmpty
              ? const CommonState(
                title: "No Announcements",
                image: Assets.noAnnouncement,
                description: "There are no announcements at the moment. Check back later for updates.",
              )
              : Container(
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
            }
          )
        ],
      ),
    );
  }

  void showProductModal(context) {
    showModalBottomSheet(
      sheetAnimationStyle: AnimationStyle(
        duration: 500.milliseconds,
        curve: Curves.easeInOut
      ),
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black38,
      context: context, 
      builder: (context) {
        return CountdownModal(
          errorMessage: errorMessage, 
          secondsRemaining: secondsRemaining
        );
      }
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}