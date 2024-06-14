import 'package:get/get.dart';

import '../../../../core/domain/usecases/resident_usecase.dart';
import '../../domain/usecases/resident_usecase_impl.dart';
import '../head_family/head_family_controller.dart';
import '../profile_controller.dart';
import 'edit_head_family_controller.dart';

class EditHeadFamilyBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ResidentUseCase>(
      () => ResidentUseCaseImpl(
        residentRepository: Get.find()
      ),
      fenix: true
    );

    Get.put(
      EditHeadFamilyController(
        storageService: Get.find(),
        residentUseCase: Get.find(),
        headFamilyDelegate: Get.find<HeadFamilyController>(),
        profileDelegate: Get.find<ProfileController>()
      )
    );
  }
}