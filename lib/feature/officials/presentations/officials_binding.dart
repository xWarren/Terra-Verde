import 'package:get/get.dart';

import 'officials_controller.dart';

class OfficialsBinding extends Bindings {
  
  @override
  void dependencies() {
    Get.put(OfficialsController());
  }
}