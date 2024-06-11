import 'package:get/get.dart';

import '../../../../core/domain/usecases/resident_house_member_usecase.dart';
import '../../domain/usecases/resident_house_member_usecase_impl.dart';
import '../profile_controller.dart';
import '../profile_information/profile_information_controller.dart';
import 'edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ResidentHouseMemberUseCase>(
      () => ResidentHouseMemberUseCaseImpl(
        residentHouseMemberRepository: Get.find()
      ),
      fenix: true
    );
    
    Get.put(
      EditProfileController(
        storageService: Get.find(),
        residentHouseMemberUseCase: Get.find(),
        profileInformationDelegate: Get.find<ProfileInformationController>(),
        profileDelegate: Get.find<ProfileController>()
      )
    );
  }
}