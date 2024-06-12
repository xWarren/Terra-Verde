class FeatureEventsResponseDataModel {

  final int id;
  final String eventName;
  final String eventDate;
  final String eventImage;
  final String eventDescription;
  final String eventLocation;

  const FeatureEventsResponseDataModel({
    required this.id,
    required this.eventName,
    required this.eventDate,
    required this.eventImage,
    required this.eventDescription,
    required this.eventLocation
  });

  factory FeatureEventsResponseDataModel.fromJson(Map<String, dynamic>? json) => FeatureEventsResponseDataModel(
    id: json?["id"] ?? 0,
    eventName: json?["eventName"] ?? "",
    eventDate: json?["eventDate"] ?? "",
    eventImage: json?["eventImage"] ?? "",
    eventDescription: json?["eventDescription"] ?? "",
    eventLocation: json?["eventLocation"] ?? ""
  );
}