import 'package:get/get.dart';

import '../../core/domain/entities/events_data_entity.dart';

abstract class EventsDelegate {
  void getEventById({EventsDataEntity? eventData});  
}

class EventsController extends GetxController implements EventsDelegate {

  EventsDataEntity? eventData;
  
  @override
  void getEventById({EventsDataEntity? eventData}) {
    this.eventData = eventData;
  }
}