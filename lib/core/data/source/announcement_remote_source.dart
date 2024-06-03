import '../model/get_announcement_response_data_model.dart';
import '../model/get_announcement_response_model.dart';

abstract class AnnouncementRemoteSource {

  Future<GetAnnouncementResponseModel> getAnnouncement();
  Future<GetAnnouncementResponseDataModel> getIdFromAnnouncement({required int id});
}