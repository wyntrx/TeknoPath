//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:teknopath/constants/sizes.dart';

class OTPScreen extends StatelessWidget {
  //const OTPScreen({super.key});

  //String otp;

  // OTPScreen({super.key, required this.otp});

  // void verifyCode(BuildContext context, String inputCode) {
  //   if (otp == inputCode) {
  //     // print('same');
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => Dashboard()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage("assets/images/otp.png"),
              height: size.height * 0.3,
            ),
            Text(
              "VERIFICATION",
              style: GoogleFonts.montserrat(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              // ignore: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings
              "We sent you a code at " +
                  "user@cit.edu" +
                  "." +
                  " Please enter your otp code.",
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                //fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            OtpTextField(
              numberOfFields: 6,
              borderColor: const Color(0xFFFFDF01),
              focusedBorderColor: const Color(0xFFFFDF01),
              borderWidth: 4.0,
              showFieldAsBox: true,
              textStyle: GoogleFonts.poppins(),
              keyboardType: TextInputType.number,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              fieldWidth: 45.0,
              onSubmit: (code) {
                //var inputedOTP = code;
                //print("OTP => $inputedOTP");
                //verifyCode(context, inputedOTP);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //Get.to(() => const Dashboard());
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                child: const Text("SUBMIT CODE"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
