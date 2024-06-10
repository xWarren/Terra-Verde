import 'package:get/get.dart';

class EventsController extends GetxController {

  RxInt id = 0.obs;
  RxString eventName = "".obs;
  RxString eventDate = "".obs;
  RxString eventDescription = "".obs;

  @override
  void onInit() {
    id(Get.arguments["id"] ?? 0);
    eventName(Get.arguments["eventName"] ?? "");
    eventDate(Get.arguments["eventDate"] ?? "");
    eventDescription(Get.arguments["eventDescription"] ?? "");
    super.onInit();
  }
  
}