class GetIdResidentHouseMemberParam {

  GetIdResidentHouseMemberParam({
    required this.id
  });

  final int id;

  toJson() => {
    "id": id
  };
}