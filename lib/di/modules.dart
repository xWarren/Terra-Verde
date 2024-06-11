import 'package:get/get.dart';

import '../core/data/repositories/announcement_repository.dart';
import '../core/data/repositories/events_repository.dart';
import '../core/data/repositories/login_repository.dart';
import '../core/data/repositories/officials_repository.dart';
import '../core/data/repositories/resident_house_member_repository.dart';
import '../core/data/source/announcement_remote_source.dart';
import '../core/data/source/events_remote_source.dart';
import '../core/data/source/login_remote_source.dart';
import '../core/data/source/officials_remote_source.dart';
import '../core/data/source/resident_house_member_remote_source.dart';
import '../core/domain/services/storage_service.dart';
import '../feature/home/data/repositories/announcement_repository_impl.dart';
import '../feature/home/data/repositories/events_repository_impl.dart';
import '../feature/home/data/source/announcement_remote_source_impl.dart';
import '../feature/home/data/source/events_remote_source_impl.dart';
import '../feature/login/data/repositories/login_repository_impl.dart';
import '../feature/login/data/source/login_remote_source_impl.dart';
import '../feature/home/data/repositories/officials_repository_impl.dart';
import '../feature/home/data/source/officials_remote_source_impl.dart';
import '../feature/profile/data/repositories/resident_house_member_repository_impl.dart';
import '../feature/profile/data/source/resident_house_member_remote_source_impl.dart';

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

  // Events
  Get.put<EventsRemoteSource>(
    EventsRemoteSourceImpl(
      storageService: Get.find()
    ),
    permanent: true
  );
  Get.put<EventsRepository>(
    EventsRepositoryImpl(
      remoteSource: Get.find()
    ),
    permanent: true
  );

  // Announcement
  Get.put<AnnouncementRemoteSource>(
    AnnouncementRemoteSourceImpl(
      storageService: Get.find()
    ),
    permanent: true
  );
  Get.put<AnnouncementRepository>(
    AnnouncementRepositoryImpl(
      remoteSource: Get.find()
    ),
    permanent: true
  );

  //Residents
  Get.put<ResidentHouseMemberRemoteSource>(
    ResidentHouseMemberRemoteSourceImpl(
      storageService: Get.find()
    ),
    permanent: true
  );
  Get.put<ResidentHouseMemberRepository>(
    ResidentHouseMemberRepositoryImpl(
      remoteSource: Get.find()
    ),
    permanent: true
  );
}