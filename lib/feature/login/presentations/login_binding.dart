import 'package:get/get.dart';

import '../../../core/domain/usecases/login_usecase.dart';
import '../domain/usecases/login_usecase_impl.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<LoginUseCase>(
      () => LoginUseCaseImpl(
        loginRepository: Get.find()
      ),
      fenix: true
    );
    
    Get.put(
      LoginController(
        storageService: Get.find(),
        loginUseCase: Get.find()
      )
    );
  }
}