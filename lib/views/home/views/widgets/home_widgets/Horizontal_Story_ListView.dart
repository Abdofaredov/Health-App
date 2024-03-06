import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/constants.dart';

class HorizontalStoryListView extends StatelessWidget {
  const HorizontalStoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10.h, 0, 5.h),
        height: 100.h,
        width: 365.w,
        decoration: BoxDecoration(
            color: kpraimaryColor.withOpacity(.3),
            border: const Border.symmetric(
                horizontal: BorderSide(color: kpraimaryColor))),
        child: ListView.builder(
            clipBehavior: Clip.antiAlias,
            scrollDirection: Axis.horizontal,
            itemBuilder: (index, context) {
              return Padding(
                  padding: const EdgeInsets.all(3),
                  child: CircleAvatar(
                    radius: 40.h,
                    backgroundColor: kpraimaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(3), // Border radius
                      child: ClipOval(
                          child: Image.asset("assets/images/test.jpg")),
                    ),
                  ));
            }));
  }
}
