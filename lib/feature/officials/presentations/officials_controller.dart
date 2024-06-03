import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/domain/entities/officials_data_entity.dart';
import '../../../core/domain/usecases/officials_usecase.dart';
import '../../../core/utils/print_utils.dart';
import '../../dashboard/dashboard_controller.dart';

class OfficialsController extends GetxController {

  OfficialsController({
    required this.dashboardDelegate,
    required this.officialsUseCase
  });

  final DashboardDelegate dashboardDelegate;

  final OfficialsUseCase officialsUseCase;
  StreamSubscription? officialsSubs;

  RxBool isLoading = false.obs;

  ScrollController get scrollController => dashboardDelegate.scrollController;

  RxList<OfficialsDataEntity> officialsData = <OfficialsDataEntity>[].obs;

  void getOfficials() {
    isLoading(true);

    officialsSubs?.cancel();
    officialsSubs = officialsUseCase.execute().asStream().listen((response) {
      officialsData.assignAll(response);
      isLoading(false);
      update();
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