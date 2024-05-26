import 'dart:async';
import 'package:get/get.dart';

import '../../../core/domain/usecases/officials_usecase.dart';
import '../../../core/utils/print_utils.dart';

class OfficialsController extends GetxController {

  OfficialsController({
    required this.officialsUseCase
  });

  final OfficialsUseCase officialsUseCase;
  StreamSubscription? officialsSubs;


  RxBool isLoading = false.obs;

  void getOfficials() {
    isLoading(true);

    officialsSubs?.cancel();
    officialsSubs = officialsUseCase.execute().asStream().listen((response) {
      printUtil("NAME: ${response.name}");
      isLoading(false);
    },
    onError: (error) {
      printUtil("getOfficialsErr: $error");
      isLoading(false);
      update();
    });
  }

  @override
  void onInit() {
    getOfficials();
    super.onInit();
  }

  @override
  void onClose() {
    officialsSubs?.cancel();
    super.onClose();
  }
  
}