import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.child, required this.onPressed, this.color});
  final String child;
  final void Function()? onPressed;

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MaterialButton(
          splashColor: kpraimaryColor,
          height: 46.h,
          minWidth: 20.w,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: color ?? Color(kpraimaryColor.value)),
            borderRadius: BorderRadius.circular(23),
          ),
          color: Colors.white,
          onPressed: onPressed,
          child: Row(
            children: [
              Text(
                child,
                style: TextStyle(fontSize: 20.sp),
              ),
              const Icon(
                Icons.arrow_right_alt,
                size: 40,
              )
            ],
          )),
    );
  }
}
