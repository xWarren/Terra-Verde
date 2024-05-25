import 'package:get/get.dart';

import 'add_family_member_controller.dart';

class AddFamilyMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      AddFamilyMemberController()
    );
  }
}