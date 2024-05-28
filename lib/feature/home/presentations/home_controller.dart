import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/domain/entities/events_data_entity.dart';
import '../../../core/domain/services/storage_service.dart';
import '../../../core/domain/usecases/events_use_case.dart';
import '../../../core/utils/print_utils.dart';
import '_components/events_section.dart';

class HomeController extends GetxController {
  
  HomeController({
    required this.storageService,
    required this.eventsUseCase
  });
  
  final StorageService storageService;

  final EventsUseCase eventsUseCase;
  StreamSubscription? eventsSubs;

  StreamSubscription? idEventSubs;

  RxBool isLoading = false.obs;

  RxInt id = 0.obs;

  RxList<EventsDataEntity> eventsData = <EventsDataEntity>[].obs;

  GlobalKey<EventsSectionState> eventSectionKey = GlobalKey<EventsSectionState>();

  void getEvents() {
    isLoading(true);

    eventsSubs?.cancel();
    eventsSubs = eventsUseCase.execute().asStream().listen((response) {

      eventsData.assignAll(response);
      eventSectionKey.currentState?.addEventsData(response);
      isLoading(false);
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
      
      printUtil(response.eventDate);
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
    getEvents();
    super.onInit();
  }


  @override
  void onClose() {
    eventsSubs?.cancel();
    idEventSubs?.cancel();
    super.onClose();
  }
}