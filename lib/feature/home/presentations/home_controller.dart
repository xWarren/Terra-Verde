import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/domain/services/storage_service.dart';
import '../../../core/domain/usecases/announcement_use_case.dart';
import '../../../core/domain/usecases/events_use_case.dart';
import '../../../core/domain/usecases/officials_usecase.dart';
import '../../../core/routes/routes.dart';
import '../../../core/utils/print_utils.dart';
import '../../dashboard/dashboard_controller.dart';
import '_components/announcements_section.dart';
import '_components/events_section.dart';
import '_components/officials_section.dart';
import 'events/events_page.dart';

class HomeController extends GetxController {
  
  HomeController({
    required this.storageService,
    required this.dashboardDelegate,
    required this.eventsUseCase,
    required this.announcementUseCase,
    required this.officialsUseCase
  });
  
  final StorageService storageService;
  final DashboardDelegate dashboardDelegate;

  final EventsUseCase eventsUseCase;
  StreamSubscription? eventsSubs;

  final AnnouncementUseCase announcementUseCase;
  StreamSubscription? announcementSubs;

  final OfficialsUseCase officialsUseCase;
  StreamSubscription? officialsSubs;

  StreamSubscription? idEventSubs;
  StreamSubscription? idAnnouncementSubs;

  ScrollController get scrollController => dashboardDelegate.scrollController;

  RxBool isLoading = true.obs;

  RxInt id = 0.obs;


  GlobalKey<EventsSectionState> eventSectionKey = GlobalKey<EventsSectionState>();
  GlobalKey<AnnouncementsSectionState> announcementSectionKey = GlobalKey<AnnouncementsSectionState>();
  GlobalKey<OfficialsSectionState> officialsSectionKey = GlobalKey<OfficialsSectionState>();

  @override
  void onInit() {
    getAnnouncement();
    getEvents();
    getOfficials();
    super.onInit();
  }

  Future onRefresh() async {
    getAnnouncement();
    getEvents();
    getOfficials();
    Future.wait([
      announcementSubs!.asFuture(),
      eventsSubs!.asFuture(),
      officialsSubs!.asFuture()
    ]);
  }

  void getEvents() {
    isLoading(true);
    eventSectionKey.currentState?.setLoading(true);
    eventsSubs?.cancel();
    eventsSubs = eventsUseCase.getEvents().asStream().listen((response) {
      eventSectionKey.currentState?.addEventsData(response);
      isLoading(false);
      eventSectionKey.currentState?.setLoading(false);
      update();
    },
    onError: (error) {

      printUtil("getEventsErr: $error");
      isLoading(false);
      eventSectionKey.currentState?.setLoading(false);
      update();
    });
  }


  void getIdFromEvents({required int id}) {
    idEventSubs?.cancel();
    idEventSubs = eventsUseCase.getIdFromEvent(id: id).asStream().listen((response) {
      Get.to(EventsPage(idEventsData: response));
      printUtil(response.eventDate);
      update();
    },
    onError: (error) {
      printUtil("getEventsErr: $error");
    });
  }

  void getAnnouncement() {
    isLoading(true);
    announcementSectionKey.currentState?.setLoading(true);
    announcementSubs?.cancel();
    announcementSubs = announcementUseCase.getAnnouncement().asStream().listen((response) {
      announcementSectionKey.currentState?.addAnnouncementData(response);
      isLoading(false);
      announcementSectionKey.currentState?.setLoading(false);
      update();
    },
    onError: (error) {
      printUtil("getEventsErr: $error");
      announcementSectionKey.currentState?.setErrorMessage(error.toString());
      announcementSectionKey.currentState?.setLoading(false);
      isLoading(false);
      update();
    });
  }


  void getIdFromAnnouncement({required int id}) {
    idAnnouncementSubs?.cancel();
    idAnnouncementSubs = announcementUseCase.getIdFromAnnouncement(id: id).asStream().listen((response) {
      printUtil(response.announcementDate);
      // eventsData.assignAll(response);
      // eventSectionKey.currentState?.addEventsData(response);
      update();
    },
    onError: (error) {
      printUtil("getEventsErr: $error");
    });
  }


  void getOfficials() {
    isLoading(true);
    officialsSectionKey.currentState?.setLoading(true);
    officialsSubs?.cancel();
    officialsSubs = officialsUseCase.execute().asStream().listen((response) {
      officialsSectionKey.currentState?.addOfficialsData(response);
      isLoading(false);
      officialsSectionKey.currentState?.setLoading(false);
      update();
    },
    onError: (error) {
      printUtil("getOfficialsErr: $error");
      isLoading(false);
      officialsSectionKey.currentState?.setLoading(false);
      update();
    });
  }

    void logout() {
    storageService.clearAll();
    Get.offAndToNamed(Routes.welcomeRoute);
  }

  @override
  void onClose() {
    eventsSubs?.cancel();
    idEventSubs?.cancel();
    announcementSubs?.cancel();
    idAnnouncementSubs?.cancel();
    officialsSubs?.cancel();
    super.onClose();
  }
}