import 'package:flutter/material.dart';
import 'package:healthapp/views/auth/logIn_view/widgets/custom_column_for_Log.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String loginViewID = 'LoginView/';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomColumnLogView(),
    );
  }
}
