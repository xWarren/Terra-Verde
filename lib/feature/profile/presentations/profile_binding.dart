import 'package:get/get.dart';

import '../../../core/domain/usecases/resident_house_member_usecase.dart';
import '../../../core/domain/usecases/resident_usecase.dart';
import '../domain/usecases/resident_usecase_impl.dart';
import '../domain/usecases/resident_house_member_usecase_impl.dart';
import 'profile_controller.dart';
class ProfileBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ResidentUseCase>(
      () => ResidentUseCaseImpl(
        residentRepository: Get.find()
      ),
      fenix: true
    );

    Get.lazyPut<ResidentHouseMemberUseCase>(
      () => ResidentHouseMemberUseCaseImpl(
        residentHouseMemberRepository: Get.find()
      ),
      fenix: true
    );

    Get.put(
      ProfileController(
        storageService: Get.find(),
        residentHouseMemberUseCase: Get.find(),
        residentUseCase: Get.find()
      ),
    );
  }
}