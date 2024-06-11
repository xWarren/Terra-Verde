import 'package:get/get.dart';

import '../../../../core/domain/usecases/resident_house_member_use_case.dart';
import '../../domain/usecases/resident_house_member_usecase_impl.dart';
import '../profile_controller.dart';
import 'add_family_member_controller.dart';

class AddFamilyMemberBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ResidentHouseMemberUseCase>(
      () => ResidentHouseMemberUseCaseImpl(
        residentHouseMemberRepository: Get.find()
      ),
      fenix: true
    );
    
    Get.put(
      AddFamilyMemberController(
        residentHouseMemberUseCase: Get.find(),
        profileDelegate: Get.find<ProfileController>()
      )
    );
  }
}