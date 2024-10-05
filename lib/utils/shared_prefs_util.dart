// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPrefsUtil {
//   static Future<void> saveUsername(String username) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('username', username);
//   }

//   static Future<String?> getUsername() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('username');
//   }

//   static Future<void> removeUsername() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('username');
//   }

//   static Future<void> clearAllData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
// }
