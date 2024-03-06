import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/constants.dart';

class MainCustomButtontransparentbackground extends StatelessWidget {
  const MainCustomButtontransparentbackground(
      {super.key,
      required this.child,
      required this.onpressd,
      required this.bordercolor,
      required this.backgroundcolor,
      required this.textcolor,
      this.minWidth});
  final String child;
  final void Function()? onpressd;
  final int? bordercolor;
  final Color? backgroundcolor;
  final Color? textcolor;
  final double? minWidth;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 40.w),
      child: SizedBox(
        width: 400.w,
        child: MaterialButton(
            splashColor: kthirthColor,
            height: 46.h,
            minWidth: minWidth ?? 10.w,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(bordercolor!)),
              borderRadius: BorderRadius.circular(23),
            ),
            color: backgroundcolor,
            onPressed: onpressd,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                child,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: textcolor,
                ),
              ),
            )),
      ),
    );
  }
}
