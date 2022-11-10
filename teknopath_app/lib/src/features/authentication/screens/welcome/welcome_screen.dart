import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknopath_app/src/constants/colors.dart';
import 'package:teknopath_app/src/constants/sizes.dart';
import 'package:teknopath_app/src/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:teknopath_app/src/features/authentication/screens/login_screen/login_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage('assets/images/welcome.png'),
              height: height * 0.6,
            ),
            Column(
              children: [
                Text(
                  tWelcomeTitle,
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headline1,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const LoginScreen()),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        foregroundColor: tWhiteColor,
                        backgroundColor: tSecondaryColor,
                        padding:
                            const EdgeInsets.symmetric(vertical: tButtonHeight),
                      ),
                      child: Text("Login".toUpperCase())),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
