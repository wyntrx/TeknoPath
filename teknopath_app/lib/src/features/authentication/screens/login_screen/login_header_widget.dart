import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage("assets/images/login.png"),
          height: size.height * 0.3,
        ),
        Text(
          "Login".toUpperCase(),
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: 40,
          ),
        ),
        Text(
          "Join us to explore the Campus",
          style: GoogleFonts.montserrat(
            textStyle: Theme.of(context).textTheme.subtitle1,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
