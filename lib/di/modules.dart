import 'package:get/get.dart';

import '../core/domain/services/storage_service.dart';

Future<void> initAppDependecies() async {

  // Services
  await Get.putAsync(
    () => StorageService().init(),
    permanent: true,
  );
}