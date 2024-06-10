import 'package:get/get.dart';

import '../../../../core/domain/usecases/residents_use_case.dart';
import '../../domain/usecases/residents_usecase_impl.dart';
import '../profile_controller.dart';
import '../profile_information/profile_information_controller.dart';
import 'edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ResidentsUseCase>(
      () => ResidentsUseCaseImpl(
        residentsRepository: Get.find()
      ),
      fenix: true
    );
    
    Get.put(
      EditProfileController(
        storageService: Get.find(),
        residentsUseCase: Get.find(),
        profileInformationDelegate: Get.find<ProfileInformationController>(),
        profileDelegate: Get.find<ProfileController>()
      )
    );
  }
}