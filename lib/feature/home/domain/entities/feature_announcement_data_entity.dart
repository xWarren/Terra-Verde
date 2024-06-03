class FeatureAnnouncementDataEntity {

  const FeatureAnnouncementDataEntity({
    required this.id,
    required this.announcementName,
    required this.announcementDate,
    required this.announcementDescription
  });

  final int id;
  final String announcementName;
  final String announcementDate;
  final String announcementDescription;
}