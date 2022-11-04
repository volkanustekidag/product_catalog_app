import 'package:shared_preferences/shared_preferences.dart';

class UserServiceLocal {
  Future saveToken(token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }
}
