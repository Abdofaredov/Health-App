import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/constants.dart';

class CustomButtontransparentbackground extends StatelessWidget {
  const CustomButtontransparentbackground(
      {super.key,
      required this.child,
      required this.onpressd,
      required this.bordercolor,
      required this.backgroundcolor,
      required this.textcolor,
      this.minWidth,
      this.onLongPress,
      this.horizontal,
      this.circuller,
      this.width});
  final String child;
  final void Function()? onpressd;
  final int? bordercolor;
  final Color? backgroundcolor;
  final Color? textcolor;
  final double? minWidth;
  final void Function()? onLongPress;
  final double? horizontal;
  final double? circuller;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: horizontal ?? 70,
      width: width,
      child: MaterialButton(
          splashColor: kpraimaryColor,
          height: 48.h,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(bordercolor!)),
            borderRadius: BorderRadius.circular(circuller ?? 0),
          ),
          color: backgroundcolor,
          onLongPress: onLongPress,
          onPressed: onpressd,
          child: Text(
            child,
            style: TextStyle(
              fontSize: 16.sp,
              color: textcolor,
            ),
          )),
    );
  }
}
