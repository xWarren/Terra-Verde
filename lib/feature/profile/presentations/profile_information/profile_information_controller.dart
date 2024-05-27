import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileInformationController extends GetxController {

  RxString image = "".obs;
  RxString fistName = "".obs;
  RxString middeName = "".obs;
  RxString lastName = "".obs;
  RxString familyRelationship = "".obs;

  final birthdayController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final contactNumberController = TextEditingController();

  RxBool isLoading = false.obs;
  
}