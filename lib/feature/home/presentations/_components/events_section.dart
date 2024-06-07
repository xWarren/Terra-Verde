import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/domain/entities/events_data_entity.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/custom_colors.dart';
import '../../../../core/resources/dimensions.dart';
import 'event_shimmer.dart';

class EventsSection extends StatefulWidget {
  final Function({required int id}) getIdFromEvents;
  const EventsSection({
    super.key,
    required this.getIdFromEvents
  });

  @override
  State<EventsSection> createState() => EventsSectionState();
}

class EventsSectionState extends State<EventsSection> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  PageController pageController = PageController();

  int currentPage = 1;

  List<EventsDataEntity> eventsData = [];
  EventsDataEntity? idEventsData;
  bool isLoading = true;

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }
  

  void addEventsData(List<EventsDataEntity> events) {
    setState(() {
      eventsData.assignAll(events);
    });
  }

    void addIdEventsData(EventsDataEntity? events) {
    setState(() {
      idEventsData = events;
    });
  }

  void onChangedPage(value) {
    currentPage = value;
    pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  initState() {
    super.initState();
    pageController = PageController(
      initialPage: currentPage,
      keepPage: false,
      viewportFraction: 0.5,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
          child: EventShimmer(isLoading: isLoading),
        )
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: Dimensions.largeSpacing),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Events",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: pageController,
                itemCount: eventsData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var data = eventsData[index];
                  String dateString = data.eventDate;
                  DateTime eventDate = DateTime.parse(dateString);
              
                  DateFormat monthFormat = DateFormat('MMMM');
                  String formattedMonth = monthFormat.format(eventDate);
              
                  DateFormat dayFormat = DateFormat('d');
                  String formattedDay = dayFormat.format(eventDate);

                  return GestureDetector(
                    onTap: () => widget.getIdFromEvents(id: data.id),
                    child: Column(
                      children: [
                        Expanded(
                          child: AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              double value = 1.0;
                              if (pageController.position.haveDimensions) {
                                value = pageController.page! - index;
                                value = (1 - (value.abs() * .6)).clamp(0.0, 0.5);
                              }
                              return Center(
                                child: Container(
                                  height: Curves.easeOut.transform(value) * (context.isTablet ? 400 : 250),
                                  width: Curves.easeOut.transform(value) * (context.isTablet ? 400 : 300),
                                  decoration: BoxDecoration(
                                    color: CustomColors.white,
                                    border: const Border.fromBorderSide(
                                      BorderSide(
                                        color: CustomColors.primaryColor,
                                        width: 2
                                      )
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.25),
                                        blurRadius: 4,
                                        offset: Offset(0, 4)
                                      ),
                                    ]
                                  ),
                                  child: child
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)
                                        ),
                                        child: Image.asset(
                                          Assets.logo,
                                          height: 150,
                                          width: Get.width,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        height: 15,
                                        width: 45,
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.only(
                                          right: 20,
                                          top: 20
                                        ),
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFFBFBFB),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8)
                                          )
                                        ),
                                        child: Text(
                                          "$formattedMonth $formattedDay",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: CustomColors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: Dimensions.largeSpacing,
                                            vertical: Dimensions.largeSpacing
                                          ),
                                          child: Text(
                                            data.eventName,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: CustomColors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ),
                                      ),           
                                    ],
                                  ),
                                )
                              ],
                            )
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}