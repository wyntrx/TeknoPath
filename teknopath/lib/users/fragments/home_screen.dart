import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknopath/admin/view_building.dart';
import 'package:teknopath/constants/colors.dart';
import 'package:teknopath/users/userPreferences/current_user.dart';

class HomeScreen extends StatelessWidget {
  final CurrentUser _currentUser = Get.put(CurrentUser());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  const BoxShadow(
                    color: Color(0xFF999367),
                    blurRadius: 2,
                    offset: Offset(1, 1),
                  ),
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(-2, 0),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            width: 3,
                            color: tSecondaryColor,
                            strokeAlign: StrokeAlign.outside),
                        image: const DecorationImage(
                          image: AssetImage("images/avatar.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Student!",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        _currentUser.student.student_id,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        _currentUser.student.student_email,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black87),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20.0),
            InkWell(
              onTap: () {},
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: tPrimaryColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      const BoxShadow(
                        color: Color(0xFF999367),
                        blurRadius: 3,
                        offset: Offset(1, 1),
                      ),
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(-2, 0),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.favorite,
                        size: 30,
                        color: Color(0xFF820001),
                      ),
                      Text("Favorites",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          )),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                Get.to(() => const ViewBuilding());
              },
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: tPrimaryColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      const BoxShadow(
                        color: Color(0xFF999367),
                        blurRadius: 3,
                        offset: Offset(1, 1),
                      ),
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(-2, 0),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 30,
                        color: Color(0xFF820001),
                      ),
                      Text("Buildings",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          )),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),

            //Search

            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
