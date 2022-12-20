import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:teknopath/api_connection/api_connection.dart';
import 'package:teknopath/constants/colors.dart';
import 'package:teknopath/users/authentication/login_screen.dart';
import 'package:teknopath/users/models/user.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  //var nameController = TextEditingController();
  var emailController = TextEditingController();
  //var passwordController = TextEditingController();
  var studentIdController = TextEditingController();
  var isObsecure = true.obs;

  validateUserEmail() async {
    try {
      var url = "https://teknopath.000webhostapp.com/validate_email.php";
      var res = await http.post(Uri.parse(url), body: {
        "student_email": emailController.text.trim(),
      });
      // var res = await http.post(Uri.parse(API.validateEmail), body: {
      //   'student_email': emailController.text.trim(),

      if (res.statusCode == 200) // successful connection
      {
        var resBodyOfValidateEmail = jsonDecode(res.body);

        if (resBodyOfValidateEmail['emailFound']) {
          Fluttertoast.showToast(
              msg: "Email is already in use. Try another Email.");
        } else {
          registerAndSaveUserRecord();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  registerAndSaveUserRecord() async {
    Student userModel = Student(
      studentIdController.text.trim(),
      emailController.text.trim(),
    );

    try {
      var url = "https://teknopath.000webhostapp.com/signup.php";
      var res = await http.post(
        Uri.parse(url),
        body: userModel.toJson(),
      );

      if (res.statusCode == 200) {
        var resBodyOfSignUp = jsonDecode(res.body);
        if (resBodyOfSignUp['success'] == true) {
          Fluttertoast.showToast(msg: "SignUp Successful!");
          setState(() {
            studentIdController.clear();
            emailController.clear();
          });
        } else {
          Fluttertoast.showToast(msg: "Error Occurred, Try Again.");
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      //backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, cons) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //signup screen header
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 285,
                      child: Image.asset("images/teknopath-icon-pic.png"),
                    ),
                  ),
                  Text(
                    "Add Student",
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //signup form
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
                          children: [
                            //name-email-password-login btn
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  //name
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
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
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
                                    height: 18,
                                  ),

                                  //email
                                  TextFormField(
                                    controller: emailController,
                                    validator: (val) =>
                                        val == "" ? "Please write Email" : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.email_rounded,
                                        color: tSecondaryColor,
                                      ),
                                      labelText: "Email",
                                      labelStyle: GoogleFonts.poppins(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
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
                                    height: 18,
                                  ),

                                  //button
                                  Material(
                                    color: tSecondaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                    child: InkWell(
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          validateUserEmail();
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(30),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 28,
                                        ),
                                        child: Text(
                                          "SignUp",
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                ],
                              ),
                            ),
                            //dont have an account btn
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       "Already have an Account?",
                            //       style: GoogleFonts.poppins(
                            //         fontSize: 12,
                            //         color: Colors.black87,
                            //       ),
                            //     ),
                            //     TextButton(
                            //       onPressed: () {
                            //         Get.to(() => LoginScreen());
                            //       },
                            //       child: Text("Login Here",
                            //           style: GoogleFonts.poppins(
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.w500,
                            //               color: tSecondaryColor)),
                            //     ),
                            //   ],
                            // ),
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
