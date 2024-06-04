import 'environment.dart';

class APIEndpoint {

  static String get getBaseUrl => Environment.getBaseUrl;

  static String get login => "/Authentications/connect";
  static String get residentsHouseMembers => "/ResidentHouseMembers";
  static String get officials => "/Officials";
  static String get announcement => "/Announcement";
  static String get events => "/Events";
}