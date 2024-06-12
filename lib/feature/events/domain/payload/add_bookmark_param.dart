class AddBookmarkParam {

  AddBookmarkParam({
    required this.eventId,
    required this.eventName,
    required this.eventDescription,
    required this.eventLocation,

  });

  final int eventId;
  final String eventName;
  final String eventDescription;
  final String eventLocation;


  toJson() => {
    "eventId": eventId,
    "eventName": eventName,
    "eventDescription": eventDescription,
    "eventLocation": eventLocation,
  };
}