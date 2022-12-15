import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:teknopath/admin/admin_panel.dart';
import 'package:teknopath/constants/colors.dart';
import 'package:teknopath/users/authentication/login_screen.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  var formKey = GlobalKey<FormState>();

  // var emailController = TextEditingController();
  // var studentIdController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;
  // var otpHelper = OTPGeneration();

  // Future sendOTPToEmail({
  //   required String student_id,
  //   required String student_email,
  //   required String otpCode,
  // }) async {
  //   const serviceId = 'service_etgyg9j';
  //   const templateId = 'template_rwu937u';
  //   const userId = 'lYTTj0hNFHYeQxHmi';

  //   final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'origin': 'http://localhost',
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({
  //       'service_id': serviceId,
  //       'template_id': templateId,
  //       'user_id': userId,
  //       'template_params': {
  //         'student_receiver': emailController.text.trim(),
  //         'otpCode': otpCode,
  //       },
  //     }),
  //   );
  // }

  loginUserNow() async {
    try {
      //String otp = otpHelper.generateOTP();
      var url = "https://teknopath.000webhostapp.com/admin_login.php";
      var response = await http.post(Uri.parse(url), body: {
        "username": usernameController.text.trim(),
        "password": passwordController.text.trim(),
      });
      if (response.statusCode == 200) {
        var resBodyOfLogin = jsonDecode(response.body);

        //var resBodyOfLogin = json.decode(response.body);

        if (resBodyOfLogin['success'] == true) {
          Fluttertoast.showToast(msg: "Login Successful!");

          // sendOTPToEmail(
          //     student_id: studentIdController.text.trim(),
          //     student_email: emailController.text.trim(),
          //     otpCode: otp);

          //Student userInfo = Student.fromJson(resBodyOfLogin["userData"]);

          //save user info to local storage
          //await RememberUserPrefs.saveUserInfo(userInfo);

          Future.delayed(
            const Duration(microseconds: 2000),
            () {
              Get.to(() => const AdminPanel());
              // Get.to(() => OTPScreen(otp: otp));
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => OTPScreen(otp: otp)));
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      //backgroundColor: Colors.w,
      body: LayoutBuilder(
        builder: (context, cons) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //login screen header
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Image.asset("images/Admin1.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Admin Login",
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //login sign in form
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                                        controller: usernameController,
                                        validator: (val) => val == ""
                                            ? "Please enter your username"
                                            : null,
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(
                                            Icons.person_rounded,
                                            color: tSecondaryColor,
                                          ),
                                          labelText: "Username",
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

                                      const SizedBox(
                                        height: 18,
                                      ),
                                      //email
                                      Obx(
                                        () => TextFormField(
                                          obscureText: isObsecure.value,
                                          controller: passwordController,
                                          validator: (val) => val == ""
                                              ? "Please enter password"
                                              : null,
                                          decoration: InputDecoration(
                                            prefixIcon: const Icon(
                                              Icons.vpn_key_rounded,
                                              color: Color(0xFF820001),
                                            ),
                                            suffixIcon: Obx(
                                              () => GestureDetector(
                                                onTap: () {
                                                  isObsecure.value =
                                                      !isObsecure.value;
                                                },
                                                child: Icon(
                                                  isObsecure.value
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            labelText: "Password",
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
                                      ),
                                      const SizedBox(
                                        height: 10,
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
                                            loginUserNow();
                                          },
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
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
                                  "Are you an Student?",
                                  style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => const LoginScreen());
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
