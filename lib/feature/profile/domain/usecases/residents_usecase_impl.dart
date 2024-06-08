

import '../../../../core/data/repositories/residents_repository.dart';
import '../../../../core/domain/entities/add_resident_entity.dart';
import '../../../../core/domain/entities/residents_data_entity.dart';
import '../../../../core/domain/usecases/residents_use_case.dart';
import '../payload/add_residents_param.dart';
import '../payload/get_id_residents_param.dart';

class ResidentsUseCaseImpl implements ResidentsUseCase {

  ResidentsUseCaseImpl({
    required this.residentsRepository
  });

  final ResidentsRepository residentsRepository;

  @override
  Future<List<ResidentsDataEntity>> getResidents() {

    return residentsRepository.getResidents();
  }
  
  @override
  Future<ResidentsDataEntity> getIdFromResidents({required int id}) {

    var param = GetIdResidentsParam(
      id: id
    );

    return residentsRepository.getIdFromResidents(param);
  }
  
  @override
  Future<AddResidentEntity> addResident({
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

    var params = AddResidentsParam(
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

    return residentsRepository.addResident(params);
  }
}