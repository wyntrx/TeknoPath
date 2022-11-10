import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teknopath_app/src/constants/sizes.dart';
import 'package:teknopath_app/src/constants/text_strings.dart';

import 'Forget_Password_Btn_Widget.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
  }
}
