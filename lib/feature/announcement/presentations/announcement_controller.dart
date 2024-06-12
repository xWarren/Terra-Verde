import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AnnouncementController extends GetxController {
  
  RxInt id = 0.obs;
  RxString announcementName = "".obs;
  RxString announcementDate = "".obs;
  RxString announcementDescription = "".obs;

    String formattedMonth = "";
  String formattedTime = "";

  @override
  void onInit() {
   super.onInit();

    id(Get.arguments["id"] ?? 0);
    announcementName(Get.arguments["announcementName"] ?? "");
    announcementDate(Get.arguments["announcementDate"] ?? "");
    announcementDescription(Get.arguments["announcementDescription"] ?? "");

    String dateString = announcementDate.value;
    DateTime parsedEventDate = DateTime.parse(dateString);

    DateFormat monthFormat = DateFormat('MMMM dd');
    formattedMonth = monthFormat.format(parsedEventDate);

    DateFormat timeFormat = DateFormat('hh:mm a');
    formattedTime = timeFormat.format(parsedEventDate);
  }
}