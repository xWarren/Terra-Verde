import '../entities/announcement_data_entity.dart';

abstract class AnnouncementUseCase {

  Future<List<AnnouncementDataEntity>> getAnnouncement();
  Future<AnnouncementDataEntity> getIdFromAnnouncement({required int id});
}