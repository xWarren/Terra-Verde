import '../../../core/data/model/get_resident_house_member_data_model.dart';
import '../../../core/data/model/get_resident_house_member_response_model.dart';
import '../data/model/feature_resident_house_member_response_model.dart';
import 'get_resident_house_member_data_mapper.dart';

class GetResidentHouseMemberMapper {

  static GetResidentHouseMemberResponseModel fromFeatureResidentHouseMemberResponseModel(FeatureResidentHouseMemberResponseModel model) {
    
    return GetResidentHouseMemberResponseModel(
      data: model.data.map<GetResidentHouseMemberDataModel>((e) => GetResidentHouseMemberDataMapper.fromFeatureResidentHouseMemberDataModel(e)).toList()
    );
  }
}