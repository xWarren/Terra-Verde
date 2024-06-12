class FeatureBookmarkResponseDataModel {

  final int id;
  final int eventId;
  final String eventName;
  final String eventDate;
  final String eventImage;
  final String eventDescription;
  final String eventLocation;

  const FeatureBookmarkResponseDataModel({
    required this.id,
    required this.eventId,
    required this.eventName,
    required this.eventDate,
    required this.eventImage,
    required this.eventDescription,
    required this.eventLocation
  });

  factory FeatureBookmarkResponseDataModel.fromJson(Map<String, dynamic>? json) => FeatureBookmarkResponseDataModel(
    id: json?["id"] ?? 0,
    eventId: json?["eventId"] ?? 0,
    eventName: json?["eventName"] ?? "",
    eventDate: json?["eventDate"] ?? "",
    eventImage: json?["eventImage"] ?? "",
    eventDescription: json?["eventDescription"] ?? "",
    eventLocation: json?["eventLocation"] ?? ""
  );
}