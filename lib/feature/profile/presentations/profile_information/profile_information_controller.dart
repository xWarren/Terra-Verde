import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileInformationController extends GetxController {

  final RxString image = "".obs;
  final RxString fistName = "".obs;
  final RxString middeName = "".obs;
  final RxString lastName = "".obs;
  final RxString familyRelationship = "".obs;
  final birthdayController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final contactNumberController = TextEditingController();
  
}