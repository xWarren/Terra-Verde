class OfficialsDataEntity {
  
  const OfficialsDataEntity({
    required this.id,
    required this.name,
    required this.position,
    required this.contacts,
    required this.image
  });

  final int id;
  final String name;
  final String position;
  final int contacts;
  final String image;
}
