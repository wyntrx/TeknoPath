import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:teknopath/constants/colors.dart';
import 'package:teknopath/users/fragments/dashboard_controller.dart';
import 'package:teknopath/users/fragments/favorite_fragment.dart';
import 'package:teknopath/users/fragments/home_screen.dart';
import 'package:teknopath/users/fragments/profile_fragment.dart';
import 'package:teknopath/users/userPreferences/current_user.dart';
import 'package:teknopath/users/fragments/navigation_fragment.dart';

class DashboardOfFragments extends StatelessWidget {
  final CurrentUser _rememberCurrentUser = Get.put(CurrentUser());
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  final List<Widget> _fragmentScreens = [
    HomeScreen(),
    NavigationUnity(),
    FavoriteFragment(),
    ProfileFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller) {
        return Scaffold(
          //backgroundColor: Colors.white,
          body: SafeArea(
              child: Obx(
            () => _fragmentScreens[
                bottomNavigationController.selectedIndex.value],
          )),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: tPrimaryColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(0.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GNav(
                  tabs: const [
                    GButton(
                      icon: Icons.home_rounded,
                      text: "Home",
                    ),
                    GButton(
                      icon: Icons.map_rounded,
                      text: "Map",
                    ),
                    GButton(
                      icon: Icons.favorite_rounded,
                      text: "Favorites",
                    ),
                    GButton(
                      icon: Icons.person_rounded,
                      text: "Profile",
                    )
                  ],
                  rippleColor: Colors
                      .grey.shade800, // tab button ripple color when pressed
                  hoverColor: Colors.white, // tab button hover color
                  haptic: true, // haptic feedback
                  tabBorderRadius: 30,
                  duration:
                      Duration(milliseconds: 300), // tab animation duration
                  gap: 8, // the tab button gap between icon and text
                  color: tSecondaryColor, // unselected icon color
                  activeColor: Colors.black87, // selected icon and text color
                  iconSize: 24, // tab button icon size
                  tabBackgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  onTabChange: (value) {
                    bottomNavigationController.changeIndex(value);
                  }, // selected tab background color
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
