class EventsDataEntity {
  
  const EventsDataEntity({
    required this.id,
    required this.eventName,
    required this.eventDate,
    required this.eventImage,
    required this.eventDescription,
    required this.eventLocation
  });

  final int id;
  final String eventName;
  final String eventDate;
  final String eventImage;
  final String eventDescription;
  final String eventLocation;
}
