import 'package:api_december_2025/models/User.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  static const String userKey = 'user_data';

  final logger = Logger();

  Future<void> savaUser(User user) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(userKey, userToJson(user));
    logger.e("User Data Saved");
  }

  Future<User?> getUser() async {
    final pref = await SharedPreferences.getInstance();
    var userjson = pref.getString(userKey);
    if (userjson != null) {
      return userFromJson(userjson);
    }
    return null;
  }

  Future<void> logout() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    pref.remove(userKey);
  }

  Future<String?> getAccessKey() async {
    User? user = await getUser();
    return user!.access;
  }
}
