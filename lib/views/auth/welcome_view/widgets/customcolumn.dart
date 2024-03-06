import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/constants.dart';
import 'package:healthapp/core/custom_button.dart';
import 'package:healthapp/views/auth/logIn_view/logIn_view.dart';

class CustomColumnForWelcomeScreen extends StatelessWidget {
  const CustomColumnForWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 200.h, 16.w, 10.h),
      child: Column(
        children: [
          Image.asset(
            'assets/images/klogo.png',
            height: 150.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          // ignore: avoid_unnecessary_containers
          Text(
            "healthDelivery",
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(
                  wordSpacing: 20,
                  letterSpacing: 3,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(kscoundryColor.value),
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Color(Colors.black.value)),
            ),
          ),

          SizedBox(
            height: 180.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: CustomButton(
                  onpressd: () {
                    Navigator.pushReplacementNamed(
                        context, LoginView.loginViewID);
                  },
                  child: '   التالي   ',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
