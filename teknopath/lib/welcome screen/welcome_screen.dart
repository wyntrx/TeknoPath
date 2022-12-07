import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknopath/constants/colors.dart';
import 'package:teknopath/constants/sizes.dart';
import 'package:teknopath/constants/text_strings.dart';
import 'package:teknopath/users/authentication/login_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage('images/welcome.png'),
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
                      //onPressed: () => Get.to(() => const LoginScreen()),
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        foregroundColor: tWhiteColor,
                        backgroundColor: tSecondaryColor,
                        padding:
                            const EdgeInsets.symmetric(vertical: tButtonHeight),
                      ),
                      child: Text("Get Started".toUpperCase())),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
