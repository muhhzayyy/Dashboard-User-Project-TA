import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  // Key untuk penyimpanan agar konsisten dan tidak typo
  static const String _tokenKey = 'token';
  static const String _roleKey = 'role';
  static const String _isLoggedInKey = 'isLoggedIn';

  // Simpan Data Login
  static Future<void> saveLoginData(String token, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_roleKey, role);
    await prefs.setBool(_isLoggedInKey, true);
  }

  // Ambil Token (Akan sering dipakai saat Fetching data Inventaris)
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Ambil Role (Untuk cek dia Admin atau bukan)
  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_roleKey);
  }

  // Cek apakah sudah login (Untuk Auto-Login)
  static Future<bool> isLogged() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Hapus Data (Untuk Logout)
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Menghapus semua data yang tersimpan
  }
}
