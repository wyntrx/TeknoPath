import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teknopath/users/models/user.dart';

class RememberUserPrefs {
  //save user info
  static Future<void> saveUserInfo(Student userInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJson());
    await preferences.setString("currentUser", userJsonData);
  }

  //get user info
  static Future<Student?> readUserInfo() async {
    Student? currentUserInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userInfo = preferences.getString("currentUser");
    if (userInfo != null) {
      Map<String, dynamic> UserDataMap = jsonDecode(userInfo);
      currentUserInfo = Student.fromJson(UserDataMap);
    }
    return currentUserInfo;
  }

  static Future<Student?> removeUserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("currentUser");
  }
}
