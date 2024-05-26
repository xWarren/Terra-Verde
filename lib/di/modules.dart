import 'package:get/get.dart';

import '../core/data/repositories/login_repository.dart';
import '../core/data/repositories/officials_repository.dart';
import '../core/data/source/login_remote_source.dart';
import '../core/data/source/officials_remote_source.dart';
import '../core/domain/services/storage_service.dart';
import '../core/domain/usecases/officials_usecase.dart';
import '../feature/login/data/repositories/login_repository_impl.dart';
import '../feature/login/data/source/login_remote_source_impl.dart';
import '../feature/officials/data/repositories/officials_repository_impl.dart';
import '../feature/officials/data/source/officials_remote_source_impl.dart';
import '../feature/officials/domain/usecases/officials_usecase_impl.dart';

Future<void> initAppDependecies() async {

  // Services
  await Get.putAsync(
    () => StorageService().init(),
    permanent: true,
  );

  // Login
  Get.put<LoginRemoteSource>(
    LoginRemoteSourceImpl(
      storageService: Get.find()
    ),
    permanent: true
  );
  Get.put<LoginRepository>(
    LoginRepositoryImpl(
      remoteSource: Get.find()
    ),
    permanent: true
  );

  // Officials

  Get.lazyPut<OfficialsUseCase>(
    () => OfficialsUseCaseImpl(
      officialsRepository: Get.find()
    ),
    fenix: true
  );
  Get.put<OfficialsRemoteSource>(
    OfficialsRemoteSourceImpl(
      storageService: Get.find()
    ),
    permanent: true
  );
  Get.put<OfficialsRepository>(
    OfficialsRepositoryImpl(
      remoteSource: Get.find()
    ),
    permanent: true
  );
}