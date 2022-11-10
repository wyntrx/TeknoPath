import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknopath_app/src/constants/sizes.dart';
import 'package:teknopath_app/src/constants/text_strings.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'package:teknopath_app/src/features/authentication/screens/login_screen/otp_screen/otp_screen.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController idNumber = TextEditingController();

  Future login(BuildContext context) async {
    if (email.text == "" || idNumber.text == "") {
      Fluttertoast.showToast(
        msg: "Email or ID field cannot be blank.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    } else {
      var url = "https://teknopath.000webhostapp.com/login.php";
      var response = await http.post(Uri.parse(url), body: {
        "student_email": email.text,
        "student_id": idNumber.text,
      });

      var data = json.decode(response.body);
      if (data == "Success") {
        //Navigator push to otp screen
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OTPScreen()));
        //Get.to(() => const OTPScreen());
      } else {
        Fluttertoast.showToast(
          msg: "Email or ID may be incorrect! Try again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30.0 - 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: idNumber,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "ID Number",
                hintText: "Enter your ID number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Ex. 12-345-678",
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Institutional Email",
                hintText: "Enter your Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Ex. doe.john@cit.edu",
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(tDefaultSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tForgetPasswordTitle,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            tForgetPasswordSubtitle,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: tDefaultSize),
                          ForgetPasswordBtnWidget(
                            btnIcon: Icons.mail_outline_rounded,
                            title: tEmail,
                            subtitle: tResetViaEmail,
                            onTap: () {},
                          ),
                          const SizedBox(height: tDefaultSize),
                          ForgetPasswordBtnWidget(
                            btnIcon: Icons.mobile_friendly_rounded,
                            title: tPhone,
                            subtitle: tResetViaPhone,
                            onTap: () {},
                          ),
                          const SizedBox(height: tDefaultSize),
                        ],
                      ),
                    ),
                  );
                },
                child: Text(
                  "Forgot Password",
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Color(0xFF820001),
                  ),
                ),
              ),
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      login(context);
                    },
                    child: Text("Login".toUpperCase())))
          ],
        ),
      ),
    );
  }
}

class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final IconData btnIcon;
  final String title, subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey.shade200),
        child: Row(
          children: [
            Icon(
              btnIcon,
              size: 60.0,
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
