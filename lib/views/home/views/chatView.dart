import 'package:flutter/material.dart';
import 'package:healthapp/constants.dart';

class chatView extends StatelessWidget {
  const chatView({super.key});
  static const String id = "chatView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text(
            'الشات',
            style: TextStyle(fontSize: 40, color: kpraimaryColor),
          )
        ],
      ),
    );
  }
}
