class OfficialsResponseModel {

  const OfficialsResponseModel({
    required this.id,
    required this.name,
    required this.position,
    required this.contacts
  });

  final int id;
  final String name;
  final String position;
  final int contacts;
}