import '../../../../core/data/repositories/resident_house_member_repository.dart';
import '../../../../core/domain/entities/add_resident_entity.dart';
import '../../../../core/domain/entities/resident_house_member_data_entity.dart';
import '../../../../core/domain/usecases/resident_house_member_use_case.dart';
import '../payload/add_resident_house_member_param.dart';
import '../payload/edit_profile_param.dart';
import '../payload/get_id_resident_house_member_param.dart';

class ResidentHouseMemberUseCaseImpl implements ResidentHouseMemberUseCase {

  ResidentHouseMemberUseCaseImpl({
    required this.residentHouseMemberRepository
  });

  final ResidentHouseMemberRepository residentHouseMemberRepository;

  @override
  Future<List<ResidentHouseMemberDataEntity>> getResidentHouseMember() {

    return residentHouseMemberRepository.getResidentHouseMember();
  }
  
  @override
  Future<ResidentHouseMemberDataEntity> getIdFromResidentHouseMember({required int id}) {

    var param = GetIdResidentHouseMemberParam(
      id: id
    );

    return residentHouseMemberRepository.getIdFromResidentHouseMember(param);
  }
  
  @override
  Future<AddResidentEntity> addResidentHouseMember({
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
  }) {

    var params = AddResidentHouseMemberParam(
      residentId: residentId, 
      firstName: firstName, 
      middleName: middleName, 
      lastName: lastName, 
      contactNumber: contactNumber, 
      emailAddress: emailAddress, 
      address: address, 
      birthDate: birthDate, 
      gender: gender, 
      profileImage: profileImage, 
      relationship: relationship, 
      password: password
    );

    return residentHouseMemberRepository.addResidentHouseMember(params);
  }
  
  @override
  Future<AddResidentEntity> editProfile({
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
  }) {

   var params = EditProfileParam(
    id: id,
    residentId: residentId, 
    firstName: firstName, 
    middleName: middleName, 
    lastName: lastName, 
    contactNumber: contactNumber, 
    emailAddress: emailAddress, 
    address: address, 
    birthDate: birthDate, 
    gender: gender, 
    profileImage: profileImage, 
    relationship: relationship, 
    password: password
  );
  
  return residentHouseMemberRepository.editProfile(params);
  }
}