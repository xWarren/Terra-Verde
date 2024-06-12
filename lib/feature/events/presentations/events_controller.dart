import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventsController extends GetxController {
  

  RxInt id = 0.obs;
  RxString eventName = "".obs;
  RxString eventDate = "".obs;
  RxString eventDescription = "".obs;

  double expandedHeight = 350.0;
  double collapsedHeight = 60.0;

  String formattedMonth = "";
  String formattedTime = "";

  @override
  void onInit() {
   super.onInit();

    id(Get.arguments["id"] ?? 0);
    eventName(Get.arguments["eventName"] ?? "");
    eventDate(Get.arguments["eventDate"] ?? "");
    eventDescription(Get.arguments["eventDescription"] ?? "");

    String dateString = eventDate.value;
    DateTime parsedEventDate = DateTime.parse(dateString);

    DateFormat monthFormat = DateFormat('MMMM dd, yyyy');
    formattedMonth = monthFormat.format(parsedEventDate);

    DateFormat timeFormat = DateFormat('hh:mma');
    formattedTime = timeFormat.format(parsedEventDate);
  }
  
}