import 'package:get/get.dart';

import '../../../../core/domain/usecases/resident_usecase.dart';
import '../../domain/usecases/resident_usecase_impl.dart';
import 'head_family_controller.dart';

class HeadFamilyBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ResidentUseCase>(
      () => ResidentUseCaseImpl(
        residentRepository: Get.find()
      ),
      fenix: true
    );
    
    Get.put(
      HeadFamilyController(
        storageService: Get.find(),
        residentUseCase: Get.find()
      )
    );
  }
}