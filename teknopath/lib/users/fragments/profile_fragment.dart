import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknopath/constants/colors.dart';
import 'package:teknopath/users/authentication/login_screen.dart';
import 'package:teknopath/users/fragments/about_us_screen.dart';
import 'package:teknopath/users/fragments/contact_us_screen.dart';
import 'package:teknopath/users/userPreferences/current_user.dart';
import 'package:teknopath/users/userPreferences/user_preferences.dart';

class ProfileFragment extends StatelessWidget {
  final CurrentUser _currentUser = Get.put(CurrentUser());

  signOutUser() async {
    var resultResponse = await Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.white,
        title: Text(
          "Logout",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        content: Text(
          "Are you sure you want to logout?",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "No",
              style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: "loggedOut");
            },
            child: Text(
              "Yes",
              style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87),
            ),
          )
        ],
      ),
    );

    if (resultResponse == "loggedOut") {
      //delete the user data from phone local storage
      RememberUserPrefs.removeUserInfo().then((value) {
        Get.off(() => const LoginScreen());
      });
    }
  }

  Widget userInfoItemProfile(IconData iconData, String userData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: tPrimaryColor, width: 2.0),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: tSecondaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            userData,
            style: GoogleFonts.montserrat(
              fontSize: 15,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ListView(
        children: [
          Center(
            child: Image.asset(
              "images/avatar.png",
              width: 240,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          userInfoItemProfile(Icons.person, _currentUser.student.student_id),
          const SizedBox(
            height: 10,
          ),
          userInfoItemProfile(Icons.email, _currentUser.student.student_email),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Material(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () {
                  signOutUser();
                },
                borderRadius: BorderRadius.circular(32),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(() => const AboutUs());
                },
                child: Text(
                  "About Us",
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[500],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const ContactUs());
                },
                child: Text(
                  "Contact Us",
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Text(
                "Version 1.0",
                style: GoogleFonts.montserrat(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[500],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
