class EventsParam {

  EventsParam({
    required this.id
  });

  final int id;

  toJson() => {
    "id": id
  };
}