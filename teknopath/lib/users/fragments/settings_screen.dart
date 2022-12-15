import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknopath/constants/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Text("Settings"),
          Material(
            color: tSecondaryColor,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 28,
                ),
                child: Text(
                  "Ab",
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
    );
  }
}
