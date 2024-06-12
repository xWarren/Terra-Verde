import '../../../../core/data/model/add_bookmark_response_model.dart';
import '../../../../core/data/model/get_bookmark_data_model.dart';
import '../../../../core/data/model/get_bookmark_response_model.dart';
import '../../../../core/data/source/bookmark_remote_source.dart';
import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/resources/api_endpoint.dart';
import '../../../../core/utils/base_get_connect.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../../events/data/model/feature_add_bookmark_response_model.dart';
import '../../../events/mapper/add_bookmark_mapper.dart';
import '../../mapper/bookmark_data_mapper.dart';
import '../../mapper/bookmark_mapper.dart';
import '../model/feature_bookmark_response_data_model.dart';
import '../model/feature_bookmark_response_model.dart';

class BookmarkRemoteSourceImpl extends BaseGetConnect implements BookmarkRemoteSource {

  BookmarkRemoteSourceImpl({
    required this.storageService
  });

  final StorageService storageService;

  @override
  Future<GetBookmarkResponseModel> bookmark() async {
    var response = await methodRequest(
      APIEndpoint.bookmark,
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureBookmarkResponseModel.fromJson(response.body);
    return BookmarkMapper.fromFeatureBookmarkResponseModel(featureResponseModel);
  }
  
  @override
  Future<GetBookmarkDataModel> getIdFromBookmark({required int id}) async {
    var response = await methodRequest(
      "${APIEndpoint.bookmark}/$id",
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureBookmarkResponseDataModel.fromJson(response.body);
    return BookmarkDataMapper.fromFeatureBookmarkResponseDataModel(featureResponseModel);
  }

  @override
  Future<AddBookmarkResponseModel> addBookmark(body) async {
    var response = await methodRequest(
      APIEndpoint.bookmark,
      method: Method.post,
      params: body,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureAddBookmarkResponseModel.fromJson(response.body);
    return AddBookmarkMapper.fromFeatureAddBookmarkResponseModel(featureResponseModel);
  }
}