import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknopath/constants/colors.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Contact Us",
            style: GoogleFonts.montserrat(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.phone_android_rounded,
                          color: tSecondaryColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 8.0),
                          child: Text(
                            "+6391-234-6789",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.email_rounded, color: tSecondaryColor),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 8.0),
                          child: Text(
                            "teknopath.cit@gmail.com",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_pin, color: tSecondaryColor),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 8.0),
                          child: Text(
                            "6000, N. Bacalso Ave, Cebu CIty",
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
