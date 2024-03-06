import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/constants.dart';
import 'package:healthapp/core/custom_text_with_Google_fonts.dart';

class containersGenderRadios extends StatefulWidget {
  const containersGenderRadios({
    super.key,
  });
  @override
  State<containersGenderRadios> createState() => _containersGenderRadiosState();
}

List<String> options = ['ذكر', 'أنثى'];

class _containersGenderRadiosState extends State<containersGenderRadios> {
  @override
  Widget build(BuildContext context) {
    String currentindex = options[0];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.transparent,
        border: Border.all(color: kthirthColor, width: 1.3),
      ),
      child: Column(
        children: [
          RadioListTile(
            title: Padding(
              padding: EdgeInsets.only(left: 210.w),
              child: const TextwidgetWtihFontsGoogle(
                chiled: 'ذكر',
              ),
            ),
            value: options[0],
            groupValue: currentindex,
            onChanged: (value) {
              currentindex = value.toString();
              setState(() {});
            },
          ),
          RadioListTile(
              title: Padding(
                padding: EdgeInsets.only(left: 206.w),
                child: const TextwidgetWtihFontsGoogle(
                  chiled: 'أنثى',
                ),
              ),
              value: options[1],
              groupValue: currentindex,
              onChanged: (value) {
                currentindex = value.toString();
                setState(() {});
              })
        ],
      ),
    );
  }
}
