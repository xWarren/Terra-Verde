import '../../../feature/home/domain/payload/announcement_param.dart';
import '../../domain/entities/announcement_data_entity.dart';

abstract class AnnouncementRepository {

  Future<List<AnnouncementDataEntity>> announcement();
  Future<AnnouncementDataEntity> getIdFromAnnouncement(AnnouncementParam param); 
}