import '../../../../core/data/repositories/announcement_repository.dart';
import '../../../../core/data/source/announcement_remote_source.dart';
import '../../../../core/domain/entities/announcement_data_entity.dart';
import '../../domain/entities/feature_announcement_data_entity.dart';
import '../../domain/payload/announcement_param.dart';
import '../../mapper/announcement_data_mapper.dart';

class AnnouncementRepositoryImpl implements AnnouncementRepository {

  AnnouncementRepositoryImpl({
    required this.remoteSource
  });

  final AnnouncementRemoteSource remoteSource;

  @override
  Future<List<AnnouncementDataEntity>> announcement() async {
    var response = await remoteSource.getAnnouncement();
    var featureEntity = response.data.map<FeatureAnnouncementDataEntity>((e) => AnnouncementDataMapper.fromGetAnnouncementResponseDataModel(e)).toList();
    var entity = featureEntity.map<AnnouncementDataEntity>((e) => AnnouncementDataMapper.fromFeatureAnnouncementDataEntity(e)).toList();
    return entity;
  }

  @override
  Future<AnnouncementDataEntity> getIdFromAnnouncement(AnnouncementParam param) async {
    var response = await remoteSource.getIdFromAnnouncement(id: param.id);
    var featureEntity = AnnouncementDataMapper.fromGetAnnouncementResponseDataModel(response);
    var entity = AnnouncementDataMapper.fromFeatureAnnouncementDataEntity(featureEntity);
    return entity;
  }
}