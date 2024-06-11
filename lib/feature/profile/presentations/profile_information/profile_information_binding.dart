import 'package:get/get.dart';

import '../../../../core/domain/usecases/resident_house_member_use_case.dart';
import '../../domain/usecases/resident_house_member_usecase_impl.dart';
import 'profile_information_controller.dart';

class ProfileInformationBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ResidentHouseMemberUseCase>(
      () => ResidentHouseMemberUseCaseImpl(
        residentHouseMemberRepository: Get.find()
      ),
      fenix: true
    );

    Get.put(
      ProfileInformationController(
        residentHouseMemberUseCase: Get.find(),
        storageService: Get.find()
      )
    );
  }
}