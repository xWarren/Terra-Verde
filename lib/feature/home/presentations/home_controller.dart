import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/domain/entities/announcement_data_entity.dart';
import '../../../core/domain/entities/events_data_entity.dart';
import '../../../core/domain/services/storage_service.dart';
import '../../../core/domain/usecases/announcement_use_case.dart';
import '../../../core/domain/usecases/events_use_case.dart';
import '../../../core/utils/print_utils.dart';
import '../../dashboard/dashboard_controller.dart';
import '_components/announcements_section.dart';
import '_components/events_section.dart';
import 'events/events_page.dart';

class HomeController extends GetxController {
  
  HomeController({
    required this.storageService,
    required this.dashboardDelegate,
    required this.eventsUseCase,
    required this.announcementUseCase
  });
  
  final StorageService storageService;
  final DashboardDelegate dashboardDelegate;

  final EventsUseCase eventsUseCase;
  StreamSubscription? eventsSubs;

  final AnnouncementUseCase announcementUseCase;
  StreamSubscription? announcementSubs;

  StreamSubscription? idEventSubs;
  StreamSubscription? idAnnouncementSubs;

  ScrollController get scrollController => dashboardDelegate.scrollController;

  RxBool isLoading = false.obs;

  RxInt id = 0.obs;

  RxList<EventsDataEntity> eventsData = <EventsDataEntity>[].obs;
  RxList<AnnouncementDataEntity> announcementData = <AnnouncementDataEntity>[].obs;

  GlobalKey<EventsSectionState> eventSectionKey = GlobalKey<EventsSectionState>();
  GlobalKey<AnnouncementsSectionState> announcementSectionKey = GlobalKey<AnnouncementsSectionState>();

  void getEvents() {
    isLoading(true);
    eventSectionKey.currentState?.setLoading(true);

    eventsSubs?.cancel();
    eventsSubs = eventsUseCase.getEvents().asStream().listen((response) {

      eventsData.addAll(response);
      eventSectionKey.currentState?.addEventsData(response);
      isLoading(false);
      eventSectionKey.currentState?.setLoading(false);
      update();
    },
    onError: (error) {
      printUtil("getEventsErr: $error");
      isLoading(false);
      update();
    });
  }


  void getIdFromEvents({required int id}) {
    isLoading(true);

    idEventSubs?.cancel();
    idEventSubs = eventsUseCase.getIdFromEvent(id: id).asStream().listen((response) {
      Get.to(EventsPage(idEventsData: response));
      printUtil(response.eventDate);
      eventSectionKey.currentState?.addIdEventsData(response);
      isLoading(false);
      update();
    },
    onError: (error) {
      printUtil("getEventsErr: $error");
      isLoading(false);
      update();
    });
  }

  void getAnnouncement() {
    isLoading(true);
    eventSectionKey.currentState?.setLoading(true);

    announcementSubs?.cancel();
    announcementSubs = announcementUseCase.getAnnouncement().asStream().listen((response) {
      
      announcementData.addAll(response);
      announcementSectionKey.currentState?.addAnnouncementData(announcementData);
      isLoading(false);
      eventSectionKey.currentState?.setLoading(false);
      update();
    },
    onError: (error) {
      printUtil("getEventsErr: $error");
      isLoading(false);
      update();
    });
  }


  void getIdFromAnnouncement({required int id}) {
    isLoading(true);

    idAnnouncementSubs?.cancel();
    idAnnouncementSubs = announcementUseCase.getIdFromAnnouncement(id: id).asStream().listen((response) {
      printUtil(response.announcementDate);
      // eventsData.assignAll(response);
      // eventSectionKey.currentState?.addEventsData(response);
      isLoading(false);
      update();
    },
    onError: (error) {
      printUtil("getEventsErr: $error");
      isLoading(false);
      update();
    });
  }

  @override
  void onInit() {
    getAnnouncement();
    getEvents();
    super.onInit();
  }


  @override
  void onClose() {
    eventsSubs?.cancel();
    idEventSubs?.cancel();
    announcementSubs?.cancel();
    idAnnouncementSubs?.cancel();
    super.onClose();
  }
}