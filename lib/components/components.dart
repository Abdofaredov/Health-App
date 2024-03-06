import 'package:flutter/material.dart';

Widget defaultTextButton({
  required String text,
  required Function() function,
  Color? color,
  double? size,
  FontWeight? fontWeight,
}) =>
    TextButton(
      onPressed: function,
      child: Text(text.toUpperCase(),
          style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: fontWeight,
          )),
    );

void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

PreferredSizeWidget? defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_right_alt_rounded),
      ),
      titleSpacing: 5.0,
      title: Text(title!),
      actions: actions,
    );
