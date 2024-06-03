import '../../../../core/data/repositories/announcement_repository.dart';
import '../../../../core/domain/entities/announcement_data_entity.dart';
import '../../../../core/domain/usecases/announcement_use_case.dart';
import '../payload/announcement_param.dart';

class AnnouncementUseCaseImpl implements AnnouncementUseCase {

  AnnouncementUseCaseImpl({
    required this.announcementRepository
  });

  final AnnouncementRepository announcementRepository;

  @override
  Future<List<AnnouncementDataEntity>> getAnnouncement() {

    return announcementRepository.announcement();
  }
  
  @override
  Future<AnnouncementDataEntity> getIdFromAnnouncement({required int id}) {

    var param = AnnouncementParam(
      id: id
    );

    return announcementRepository.getIdFromAnnouncement(param);
  }
}