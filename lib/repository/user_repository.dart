import 'package:wavy/service/AuthApi.dart';
import 'package:wavy/service/getit/service_locator.dart';

import '../model/User.dart';

class UserRepository {
  final AuthApi _authApi;
  UserRepository() : _authApi = ServiceLocator.locator.get<AuthApi>();
  Future<User?> login(String email, String password, String language) async {
    try {
      final user = await _authApi.login(email, password, language);
      return user;
    } catch (e) {
      throw e.toString();
    }
  }
}
