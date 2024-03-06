import 'package:flutter/material.dart';
import 'package:healthapp/views/auth/welcome_view/widgets/customcolumn.dart';

class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});
  static String welcomeScreenID = 'welcomeScreen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomColumnForWelcomeScreen());
  }
}
