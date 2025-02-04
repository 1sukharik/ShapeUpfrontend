import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _keyUserId = 'user_id';
  static const _keyJwtToken = 'jwt_token';
  static const _keyRefreshToken = 'refresh_token';

  static Future<void> saveUserData({
    required String userId,
    required String jwtToken,
    required String refreshToken,
  }) async {
    await _storage.write(key: _keyUserId, value: userId);
    await _storage.write(key: _keyJwtToken, value: jwtToken);
    await _storage.write(key: _keyRefreshToken, value: refreshToken);
  }

  static Future<String?> getUserId() => _storage.read(key: _keyUserId);
  static Future<String?> getJwtToken() => _storage.read(key: _keyJwtToken);
  static Future<String?> getRefreshToken() => _storage.read(key: _keyRefreshToken);

  static Future<void> clearAllData() async {
    await _storage.delete(key: _keyUserId);
    await _storage.delete(key: _keyJwtToken);
    await _storage.delete(key: _keyRefreshToken);
  }
}