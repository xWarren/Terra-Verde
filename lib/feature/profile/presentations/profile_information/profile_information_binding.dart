import 'package:get/get.dart';

import '../../../../core/domain/usecases/residents_use_case.dart';
import '../../domain/usecases/residents_usecase_impl.dart';
import 'profile_information_controller.dart';

class ProfileInformationBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ResidentsUseCase>(
      () => ResidentsUseCaseImpl(
        residentsRepository: Get.find()
      ),
      fenix: true
    );

    Get.put(
      ProfileInformationController(
        residentsUseCase: Get.find(),
        storageService: Get.find()
      )
    );
  }
}