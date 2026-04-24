import 'package:project_ta3/services/db_helper.dart';

class AuthService {
  static Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    /// LOGIN DUMMY
    if (username == "admin" && password == "1234") {
      await PrefsHelper.saveLoginData("dummy_token", "admin");
      return true;
    } else {
      return false;
    }
  }
}
