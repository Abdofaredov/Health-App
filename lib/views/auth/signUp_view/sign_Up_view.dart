import 'package:flutter/material.dart';
import 'package:healthapp/views/auth/signUp_view/ColumnforsignUp.dart';

class SignUpview extends StatelessWidget {
  const SignUpview({super.key});
  static String signUpID = 'SignUpview';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ColumnforsignUp(),
    );
  }
}
