class ResidentParam {

  ResidentParam({
    required this.id
  });

  final int id;

  toJson() => {
    "id": id
  };
}