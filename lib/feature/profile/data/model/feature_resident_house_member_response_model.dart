import 'feature_resident_house_member_data_model.dart';

class FeatureResidentHouseMemberResponseModel {

  final List<FeatureResidentHouseMemberDataModel> data;

  const FeatureResidentHouseMemberResponseModel({
    required this.data
  });

  factory FeatureResidentHouseMemberResponseModel.fromJson(List<dynamic> json) => FeatureResidentHouseMemberResponseModel(
    data: json.map((e) => FeatureResidentHouseMemberDataModel.fromJson(e)).toList()
  );
}