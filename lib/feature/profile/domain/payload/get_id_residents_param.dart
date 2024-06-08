class GetIdResidentsParam {

  GetIdResidentsParam({
    required this.id
  });

  final int id;

  toJson() => {
    "id": id
  };
}