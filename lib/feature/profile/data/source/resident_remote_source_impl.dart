import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../../core/data/model/add_resident_response_model.dart';
import '../../../../core/data/model/get_resident_response_model.dart';
import '../../../../core/data/source/resident_remote_source.dart';
import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/resources/api_endpoint.dart';
import '../../../../core/utils/base_get_connect.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../../settings/mapper/get_resident_mapper.dart';
import '../../../settings/data/model/feature_resident_response_model.dart';
import '../../mapper/add_resident_mapper.dart';
import '../model/feature_add_resident_response_model.dart';

class ResidentRemoteSourceImpl extends BaseGetConnect implements ResidentRemoteSource {

  ResidentRemoteSourceImpl({
    required this.storageService
  });

  final StorageService storageService;

@override
  Future<GetResidentResponseModel> getResident({required int id}) async {
    var response = await methodRequest(
      "${APIEndpoint.resident}/$id",
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureResidentResponseModel.fromJson(response.body);
    return GetResidentMapper.fromFeatureResidentResponseModel(featureResponseModel);
  }

  @override
  Future<AddResidentResponseModel> editProfile({
    body,
    required int id,
    required int residentId,
    required String firstName,
    required String lastName,
    required String emailAddress,
    required String address,
    required String profileImage,
    required String password
  }) async {


  String uri = "https://trims-api.azurewebsites.net/api/v1/Residents?Id=$id&Email=$emailAddress&ResidentCode=$residentId&FirstName=$firstName&LastName=$lastName&Address=$address&Password=$password";


  var request = http.MultipartRequest('PUT', Uri.parse(uri))
    ..headers['Authorization'] = "Bearer ${storageService.getAccessToken()}"
    ..headers['accept'] = 'text/plain';


  request.files.add(await http.MultipartFile.fromPath(
    'File', 
    profileImage, 
    contentType: MediaType('image', 'png')
  ));

  
  if (body != null) {
    body.forEach((key, value) {
      request.fields[key] = value;
    });
  }

    // Send the request
  var response = await request.send();
     // Handle the response
  if (response.statusCode == 200) {
    log("image mo ba: $profileImage");
    var responseBody = await http.Response.fromStream(response);
    var featureResponseModel = FeatureAddResidentResponseModel.fromJson(json.decode(responseBody.body));
    return AddResidentMapper.fromFeatureAddResidentResponseModel(featureResponseModel);
  } else {
    throw Exception('Failed to edit profile: ${response.statusCode}');
  }
 }
}