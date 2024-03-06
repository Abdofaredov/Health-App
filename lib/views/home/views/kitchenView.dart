import 'package:flutter/material.dart';
import 'package:healthapp/constants.dart';

class kitchenView extends StatelessWidget {
  const kitchenView({super.key});
  static const String id = "kitchenView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text(
            'المطبخ',
            style: TextStyle(fontSize: 40, color: kpraimaryColor),
          )
        ],
      ),
    );
  }
}
