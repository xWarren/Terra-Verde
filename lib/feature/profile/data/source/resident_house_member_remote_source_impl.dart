import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../../../core/data/model/add_resident_response_model.dart';
import '../../../../core/data/model/get_resident_house_member_data_model.dart';
import '../../../../core/data/model/get_resident_house_member_response_model.dart';
import '../../../../core/data/source/resident_house_member_remote_source.dart';
import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/resources/api_endpoint.dart';
import '../../../../core/utils/base_get_connect.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../mapper/add_resident_mapper.dart';
import '../../mapper/get_resident_house_member_data_mapper.dart';
import '../../mapper/get_resident_house_member_mapper.dart';
import '../model/feature_add_resident_response_model.dart';
import '../model/feature_resident_house_member_data_model.dart';
import '../model/feature_resident_house_member_response_model.dart';

class ResidentHouseMemberRemoteSourceImpl extends BaseGetConnect implements ResidentHouseMemberRemoteSource {

  ResidentHouseMemberRemoteSourceImpl({
    required this.storageService
  });

  final StorageService storageService;

  @override
  Future<GetResidentHouseMemberResponseModel> getResidents() async {
    var response = await methodRequest(
      APIEndpoint.residentsHouseMembers,
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureResidentHouseMemberResponseModel.fromJson(response.body);
    return GetResidentHouseMemberMapper.fromFeatureResidentHouseMemberResponseModel(featureResponseModel);
  }

  @override
  Future<GetResidentHouseMemberDataModel> getIdFromResidents({required int id}) async {
    var response = await methodRequest(
      "${APIEndpoint.residentsHouseMembers}/$id",
      method: Method.get,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureResidentHouseMemberDataModel.fromJson(response.body);
    return GetResidentHouseMemberDataMapper.fromFeatureResidentHouseMemberDataModel(featureResponseModel);
  }

  @override
  Future<AddResidentResponseModel> addResident({
    body,
    required int residentId,
    required String firstName,
    required String middleName,
    required String lastName,
    required int contactNumber,
    required String emailAddress,
    required String address,
    required String birthDate,
    required String gender,
    required String profileImage,
    required String relationship,
    required String password  
  }) async {

    String uri = "https://trims-api.azurewebsites.net/api/v1/ResidentHouseMembers";

    var request = http.MultipartRequest('POST', Uri.parse(uri))
    ..headers['Authorization'] = "Bearer ${storageService.getAccessToken()}"
    ..headers['accept'] = 'text/plain'
    ..fields['ResidentId'] = residentId.toString()
    ..fields['FirstName'] = firstName
    ..fields['MiddleName'] =  middleName
    ..fields['LastName'] = lastName
    ..fields['EmailAddress'] = emailAddress
    ..fields['Gender'] = gender
    ..fields['ContactNumber'] = contactNumber.toString()
    ..fields['BirthDate'] = birthDate
    ..fields['Address'] = address
    ..fields['Relationship'] = relationship
    ..fields['Password'] = password;

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

    var response = await request.send();

    if (response.statusCode == 200) {
      log("ASDASD1 ${profileImage}");
      var responseBody = await http.Response.fromStream(response);
      var featureResponseModel = FeatureAddResidentResponseModel.fromJson(json.decode(responseBody.body));
      return AddResidentMapper.fromFeatureAddResidentResponseModel(featureResponseModel);
    } else {
      throw Exception('Failed to add profile: ${response.statusCode}');
    }
  }
  
  @override
  Future<AddResidentResponseModel> editProfile({
    body,
    required int id,
    required int residentId,
    required String firstName,
    required String middleName,
    required String lastName,
    required int contactNumber,
    required String emailAddress,
    required String address,
    required String birthDate,
    required String gender,
    required String profileImage,
    required String relationship,
    required String password   
  }) async {
  
  String uri = "https://trims-api.azurewebsites.net/api/v1/ResidentHouseMembers?Id=$id&ResidentId=$residentId&FirstName=$firstName&MiddleName=$middleName&LastName=$lastName&ContactNumber=$contactNumber&EmailAddress=$emailAddress&Address=$address&BirthDate=$birthDate&Gender=$gender&Password=$password&Relationship=$relationship";

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
    var responseBody = await http.Response.fromStream(response);
    var featureResponseModel = FeatureAddResidentResponseModel.fromJson(json.decode(responseBody.body));
    return AddResidentMapper.fromFeatureAddResidentResponseModel(featureResponseModel);
   } else {
    throw Exception('Failed to edit profile: ${response.statusCode}');
   }
 }
  
  @override
  Future<AddResidentResponseModel> deleteResidentHouseMember({required int id}) async {
    var response = await methodRequest(
      "${APIEndpoint.residentsHouseMembers}/$id",
      method: Method.delete,
      headers: {
      "Authorization": "Bearer ${storageService.getAccessToken()}"
      }
    );
    var featureResponseModel = FeatureAddResidentResponseModel.fromJson(response.body);
    return AddResidentMapper.fromFeatureAddResidentResponseModel(featureResponseModel);
  }
}