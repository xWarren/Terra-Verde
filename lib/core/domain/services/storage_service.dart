import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {

  final String _accessTokenKey = "access_token_key";
  final String _refreshTokenKey = "refresh_token_key";
  final String _isRememberKey = "is_remember_key";
  final String _isLoginKey = "is_login_key";
  final String _isHeadFamilyKey = "is_head_family_key";
  final String _firstNameKey = "first_name_key";
  final String _lastNameKey = "last_name_key";
  final String _emailKey = "email_key";
  final String _passwordKey = "password_key";
  final String _residentIdKey = "resident_id_key";
  final String _idKey = "id_key";
  final String _pictureKey = "picture_key";

  final storage = GetStorage();

  Future<StorageService> init() async {
    await GetStorage.init("UserPref");
    return this;
  }

  void saveAccessToken(String value) {
    storage.write(_accessTokenKey, value);
  }

  void saveRefreshToken(String value) {
    storage.write(_refreshTokenKey, value);
  }

  void setIsRemember(bool isRemember) {
    storage.write(_isRememberKey, isRemember);
  }

  void setLoggedIn(bool isLoggedIn) {
    storage.write(_isLoginKey, isLoggedIn);
  }

  void setMember(bool isHeadOfTheFamily) {
    storage.write(_isHeadFamilyKey, isHeadOfTheFamily);
  }
  
  void setEmail(String value) {
    storage.write(_emailKey, value);
  }

  void setPassword(String value) {
    storage.write(_passwordKey, value);
  }

  void setResidentId(String value) {
    storage.write(_residentIdKey, value);
  }

    void setId(String value) {
    storage.write(_idKey, value);
  }

  void setFirstName(String value) {
    storage.write(_firstNameKey, value);
  }

  void setLastName(String value) {
    storage.write(_lastNameKey, value);
  }

   void setPicture(String value) {
    storage.write(_pictureKey, value);
  }


  bool isRemember() => storage.read<bool>(_isRememberKey) ?? false;
  bool isLoggedIn() => storage.read<bool>(_isLoginKey) ?? false;
  bool isHeadFamily() => storage.read<bool>(_isHeadFamilyKey) ?? false;
  String getAccessToken() => storage.read<String>(_accessTokenKey) ?? "";
  String getRefreshToken() => storage.read<String>(_refreshTokenKey) ?? "";
  String getFirstName() => storage.read<String>(_firstNameKey) ?? "";
  String getLastName() => storage.read<String>(_lastNameKey) ?? "";
  String getPicture() => storage.read<String>(_pictureKey) ?? "";
  String getEmail() => storage.read<String>(_emailKey) ?? "";
  String getPassword() => storage.read<String>(_passwordKey) ?? "";
  String getResidentId() => storage.read<String>(_residentIdKey) ?? "";
  String getId() => storage.read<String>(_idKey) ?? "";

  void clearAll() {
    storage.remove(_accessTokenKey);
    storage.remove(_refreshTokenKey);
    storage.remove(_isRememberKey);
    storage.remove(_isLoginKey);
    storage.remove(_firstNameKey);
    storage.remove(_lastNameKey);
    storage.remove(_emailKey);
    storage.remove(_passwordKey);
    storage.remove(_residentIdKey);
    storage.remove(_idKey);
    storage.remove(_pictureKey);
  }
}