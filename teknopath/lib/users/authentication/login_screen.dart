import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:teknopath/admin/admin_login.dart';
import 'package:teknopath/constants/colors.dart';
import 'package:teknopath/users/authentication/otp_screen.dart';
import 'package:teknopath/users/authentication/signup_screen.dart';
import 'package:teknopath/users/models/user.dart';
import 'package:teknopath/users/userPreferences/user_preferences.dart';
import 'package:teknopath/helper/otpGeneration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var studentIdController = TextEditingController();

  var isObsecure = true.obs;
  var otpHelper = OTPGeneration();

  Future sendOTPToEmail({
    required String student_id,
    required String student_email,
    required String otpCode,
  }) async {
    const serviceId = 'service_etgyg9j';
    const templateId = 'template_rwu937u';
    const userId = 'lYTTj0hNFHYeQxHmi';

    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'student_receiver': emailController.text.trim(),
          'otpCode': otpCode,
        },
      }),
    );
  }

  loginUserNow(BuildContext context) async {
    try {
      String otp = otpHelper.generateOTP();
      var url = "https://teknopath.000webhostapp.com/login.php";
      var response = await http.post(Uri.parse(url), body: {
        "student_email": emailController.text.trim(),
        "student_id": studentIdController.text.trim(),
      });
      if (response.statusCode == 200) {
        var resBodyOfLogin = jsonDecode(response.body);

        //var resBodyOfLogin = json.decode(response.body);

        if (resBodyOfLogin['success'] == true) {
          Fluttertoast.showToast(msg: "OTP sent to your email");

          sendOTPToEmail(
              student_id: studentIdController.text.trim(),
              student_email: emailController.text.trim(),
              otpCode: otp);

          Student userInfo = Student.fromJson(resBodyOfLogin["userData"]);

          //save user info to local storage
          await RememberUserPrefs.saveUserInfo(userInfo);

          Future.delayed(
            Duration(microseconds: 2000),
            () {
              // Get.to(() => DashboardOfFragments());
              // Get.to(() => OTPScreen(otp: otp));
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OTPScreen(otp: otp)));
            },
          );
        } else {
          Fluttertoast.showToast(msg: "Invalid Credentials, Try Again.");
        }
      }
    } catch (err) {
      print("Error: " + err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.w,
      body: LayoutBuilder(
        builder: (context, cons) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //login screen header
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 285,
                      child: Image.asset("images/login.png"),
                    ),
                  ),

                  //login sign in form
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: tPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 8.0),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //-email-password-login btn
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        controller: studentIdController,
                                        validator: (val) => val == ""
                                            ? "Please enter your Student ID"
                                            : null,
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.person_rounded,
                                            color: tSecondaryColor,
                                          ),
                                          labelText: "Student ID",
                                          labelStyle: GoogleFonts.poppins(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54),

                                          //hintText: "Student ID",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 6,
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        style: GoogleFonts.poppins(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[900]),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          "Ex. 12-345-678",
                                          style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      //email
                                      TextFormField(
                                        controller: emailController,
                                        validator: (val) => val == ""
                                            ? "Please enter your Email"
                                            : null,
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.email_rounded,
                                            color: Color(0xFF820001),
                                          ),
                                          labelText: "Email",
                                          labelStyle: GoogleFonts.poppins(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: const BorderSide(
                                              color: Colors.white60,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 6,
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                        ),
                                        style: GoogleFonts.poppins(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[900],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          "Ex. student@cit.edu",
                                          style: GoogleFonts.poppins(
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 18,
                                      ),
                                    ],
                                  ),

                                  //password

                                  const SizedBox(
                                    height: 18,
                                  ),

                                  //button
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Material(
                                        color: tSecondaryColor,
                                        borderRadius: BorderRadius.circular(30),
                                        child: InkWell(
                                          onTap: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              loginUserNow(context);
                                            }
                                          },
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 28,
                                            ),
                                            child: Text(
                                              "Login",
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //dont have an account btn

                            //are you an admin button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Are you an Admin?",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => AdminLogin());
                                  },
                                  child: Text(
                                    "Click Here",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: tSecondaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
