import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teknopath/users/fragments/dashboard_of_fragmets.dart';
import 'package:teknopath/users/userPreferences/user_preferences.dart';
import 'package:teknopath/utils/theme/theme.dart';
import 'package:teknopath/welcome%20screen/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
      home: FutureBuilder(
        future: RememberUserPrefs.readUserInfo(),
        builder: (context, dataSnapShot) {
          if (dataSnapShot.data == null) {
            return const Welcome();
          } else {
            return DashboardOfFragments();
          }
        },
      ),
    );
  }
}
