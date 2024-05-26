import 'environment.dart';

class APIEndpoint {

  static String get getBaseUrl => Environment.getBaseUrl;

  static String get login => "/api/v1/Authentications/connect";
  static String get register => "/api/v1/ResidentHouseMembers";
  static String get officials => "/api/v1/Officials";
}