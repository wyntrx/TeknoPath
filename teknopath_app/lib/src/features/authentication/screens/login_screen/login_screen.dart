import 'package:flutter/material.dart';

import 'login_form.dart';
import 'login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /* -- Login Image -- */
                LoginHeaderWidget(size: size),
                /* -- Login Form -- */
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
