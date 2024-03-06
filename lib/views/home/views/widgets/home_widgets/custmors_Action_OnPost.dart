import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/constants.dart';

class CustomrsActionOnPost extends StatelessWidget {
  const CustomrsActionOnPost({
    super.key,
    required this.icon,
    required this.coloricon,
    required this.text,
  });
  final IconData icon;
  final Color coloricon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
      decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(.1),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(
                color: kpraimaryColor,
                blurRadius: 35,
                blurStyle: BlurStyle.normal)
          ]),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(.7),
                fontSize: 13.sp),
          ),
          Icon(
            icon,
            color: coloricon,
            size: 10.sp,
          ),
        ],
      ),
    );
  }
}
