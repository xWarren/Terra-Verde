import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {

  final String _accessTokenKey = "access_token_key";
  final String _refreshTokenKey = "refresh_token_key";
  final String _isRememberKey = "is_remember_key";

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

  bool isRemember() => storage.read<bool>(_isRememberKey) ?? false;
  String getAccessToken() => storage.read<String>(_accessTokenKey) ?? "";
  String getRefreshToken() => storage.read<String>(_refreshTokenKey) ?? "";

  void clearAll() {
    storage.remove(_accessTokenKey);
    storage.remove(_refreshTokenKey);
    storage.remove(_isRememberKey);
  }
}