class AnnouncementParam {

  AnnouncementParam({
    required this.id
  });

  final int id;

  toJson() => {
    "id": id
  };
}