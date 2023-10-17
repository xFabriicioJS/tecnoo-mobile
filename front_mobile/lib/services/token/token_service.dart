import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  final _storage = const FlutterSecureStorage();

  final String authKey = 'token';

  Future<void> saveToken(String token) async {
    await _storage.write(key: authKey, value: token);
  }

  Future<String?> loadToken() async {
    return await _storage.read(key: authKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: authKey);
  }
}
