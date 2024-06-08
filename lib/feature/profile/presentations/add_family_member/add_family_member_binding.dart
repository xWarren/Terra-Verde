import 'package:get/get.dart';

import '../../../../core/domain/usecases/residents_use_case.dart';
import '../../domain/usecases/residents_usecase_impl.dart';
import '../profile_controller.dart';
import 'add_family_member_controller.dart';

class AddFamilyMemberBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ResidentsUseCase>(
      () => ResidentsUseCaseImpl(
        residentsRepository: Get.find()
      ),
      fenix: true
    );
    
    Get.put(
      AddFamilyMemberController(
        residentsUseCase: Get.find(),
        profileDelegate: Get.find<ProfileController>()
      )
    );
  }
}