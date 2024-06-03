class FeatureAnnouncementResponseDataModel {

  final int id;
  final String announcementName;
  final String announcementDate;
  final String announcementDescription;

  const FeatureAnnouncementResponseDataModel({
    required this.id,
    required this.announcementName,
    required this.announcementDate,
    required this.announcementDescription
  });

  factory FeatureAnnouncementResponseDataModel.fromJson(Map<String, dynamic>? json) => FeatureAnnouncementResponseDataModel(
    id: json?["id"] ?? 0,
    announcementName: json?["announcementName"] ?? "",
    announcementDate: json?["announcementDate"] ?? "",
    announcementDescription: json?["announcementDescription"] ?? "",
  );
}