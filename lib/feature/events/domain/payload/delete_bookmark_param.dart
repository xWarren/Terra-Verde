class DeleteBookmarkParam {

  DeleteBookmarkParam({
    required this.id
  });

  final int id;

  toJson() => {
    "id": id
  };
}