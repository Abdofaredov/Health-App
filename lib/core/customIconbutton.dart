import 'package:flutter/material.dart';
import 'package:healthapp/constants.dart';

class customIconBottun extends StatelessWidget {
  const customIconBottun({
    super.key,
    this.icons,
    required this.onPressed,
  });
  final IconData? icons;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white24,
      child: IconButton(
        color: kthirthColor,
        onPressed: onPressed,
        icon: Icon(icons),
      ),
    );
  }
}
