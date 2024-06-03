class AddResidentsParam {

  AddResidentsParam({
    required this.id
  });

  final int id;

  toJson() => {
    "id": id
  };
}