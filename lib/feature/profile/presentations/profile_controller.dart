import 'dart:async';
import 'package:get/get.dart';

import '../../../core/domain/entities/residents_data_entity.dart';
import '../../../core/domain/usecases/residents_use_case.dart';
import '../../../core/utils/print_utils.dart';

class ProfileController extends GetxController {

  ProfileController({
    required this.residentsUseCase
  });

  final ResidentsUseCase residentsUseCase;
  StreamSubscription? residentsSubs;
  
  RxList<ResidentsDataEntity> residentsData = <ResidentsDataEntity>[].obs;

  RxBool isLoading = false.obs;

  RxString firstName = "".obs;
  RxString middleName = "".obs;
  RxString lastName = "".obs;
  RxString familyRelationship = "".obs;

  RxInt id = 0.obs;

  @override
  void onInit() {
    getResidentsMember();
    printUtil("hello");
    super.onInit();
  }

  void getResidentsMember() {
    isLoading(true);

    residentsSubs?.cancel();
    residentsSubs = residentsUseCase.getResidents().asStream().listen((response) {

      residentsData.assignAll(response);
      isLoading(false);
      update();
    },
    onError: (error) {
      printUtil("getResidentsMember: $error");
      isLoading(false);
      update();
    });
  }
  
  @override
  void onClose() {
    residentsSubs?.cancel();
    super.onClose();
  }
}