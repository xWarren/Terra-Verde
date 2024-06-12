class BookmarkParam {

  BookmarkParam({
    required this.id
  });

  final int id;

  toJson() => {
    "id": id
  };
}