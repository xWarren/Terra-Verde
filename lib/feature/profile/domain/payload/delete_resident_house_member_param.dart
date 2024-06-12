class DeleteResidentHouseMemberParam {

  DeleteResidentHouseMemberParam({
    required this.id
  });

  final int id;

  toJson() => {
    "id": id
  };
}