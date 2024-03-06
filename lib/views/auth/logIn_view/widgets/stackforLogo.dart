import 'package:flutter/material.dart';
import 'package:healthapp/constants.dart';

class StackForlogo extends StatelessWidget {
  const StackForlogo({
    super.key,
    this.left,
    this.top,
  });
  final double? left;
  final double? top;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: top ?? 100,
          left: left ?? 0,
          child: CircleAvatar(
            backgroundColor: Color(kpraimaryColor.withOpacity(.2).value),
            maxRadius: 60,
            minRadius: 40,
            child: Image.asset('assets/images/klogo.png'),
          ),
        ),
      ],
    );
  }
}
