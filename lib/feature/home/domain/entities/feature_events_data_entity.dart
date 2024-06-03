class FeatureEventsDataEntity {

  const FeatureEventsDataEntity({
    required this.id,
    required this.eventName,
    required this.eventDate,
    required this.eventImage,
    required this.eventDescription
  });

  final int id;
  final String eventName;
  final String eventDate;
  final String eventImage;
  final String eventDescription;
}