import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static SharedPreferences? preferences;
  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveEmail(String email) async {
    await preferences!.setString('email', email);
  }

  static String? getEmail() {
    return preferences!.getString('email');
  }

  static Future<void> savePassword(String password) async {
    await preferences!.setString('password', password);
  }
}
