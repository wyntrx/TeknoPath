import 'package:get/get.dart';
import 'package:teknopath/users/models/user.dart';
import 'package:teknopath/users/userPreferences/user_preferences.dart';

class CurrentUser extends GetxController {
  Rx<Student> _currentUser = Student("", "").obs;

  Student get student => _currentUser.value;

  getUserInfo() async {
    Student? getUserInfoFromLocalStorage =
        await RememberUserPrefs.readUserInfo();
    _currentUser.value = getUserInfoFromLocalStorage!;
  }
}
