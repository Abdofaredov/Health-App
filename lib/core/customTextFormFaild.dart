import 'package:flutter/material.dart';
import 'package:healthapp/constants.dart';

class Customtextformfield extends StatelessWidget {
  const Customtextformfield({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        textAlign: TextAlign.end,
        cursorColor: Color(kpraimaryColor.value),
        decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kscoundryColor)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kscoundryColor))),
      ),
    );
  }
}
