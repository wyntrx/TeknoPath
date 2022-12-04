import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../welcome screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //set time to load the new page
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Welcome()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 300,
              child: Image.asset('images/teknopath-icon.png'),
            ),
            SizedBox(
              height: 100,
              width: 300,
              child: Image.asset('images/teknopath-logo-text.png'),
            ),
            SizedBox(
              height: 100,
              width: 50,
              child: Lottie.asset('images/loading.json'),
            ),
          ],
        ),
      ),
    );
  }
}
