import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextwidgetWtihFontsGoogle extends StatelessWidget {
  const TextwidgetWtihFontsGoogle({
    super.key,
    required this.chiled,
  });
  final String chiled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Text(chiled,
          style: GoogleFonts.abyssinicaSil(
              textStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF000000),
          ))),
    );
  }
}
