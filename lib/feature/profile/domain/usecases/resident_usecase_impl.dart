import '../../../../core/data/repositories/resident_repository.dart';
import '../../../../core/domain/entities/add_resident_entity.dart';
import '../../../../core/domain/entities/resident_entity.dart';
import '../../../../core/domain/usecases/resident_usecase.dart';
import '../payload/edit_head_family_param.dart';
import '../../../settings/domain/payload/resident_param.dart';

class ResidentUseCaseImpl implements ResidentUseCase {

  ResidentUseCaseImpl({
    required this.residentRepository
  });

  final ResidentRepository residentRepository;

  @override
  Future<ResidentEntity> getResident({required int id}) {
     var param = ResidentParam(
      id: id
    );

    return residentRepository.getResident(param);
  }

  @override
  Future<AddResidentEntity> editProfile({
    required int id, 
    required int residentId, 
    required String firstName, 
    required String lastName, 
    required String emailAddress, 
    required String address, 
    required String profileImage, 
    required String password
  }) {
    var params = EditHeadFamilyParam(
      id: id,
      residentId: residentId, 
      firstName: firstName, 
      lastName: lastName, 
      emailAddress: emailAddress, 
      address: address,
      profileImage: profileImage,
      password: password
    );
  
  return residentRepository.editProfile(params);
  }
}