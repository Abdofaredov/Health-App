import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthapp/constants.dart';
import 'package:healthapp/cubits/navBarCubit/cubit/nav_bar_cubit_cubit.dart';
class MyCustomBottomNavBar extends StatefulWidget {
  MyCustomBottomNavBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<MyCustomBottomNavBar> createState() => _MyCustomBottomNavBarState();
}

class _MyCustomBottomNavBarState extends State<MyCustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      margin: const EdgeInsets.all(1),
      height: widget.size.width * .155,
      decoration: BoxDecoration(
          border: Border.all(color: kpraimaryColor),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: const Offset(0, 10)),
          ],
          borderRadius: BorderRadius.circular(16)),
      child: ListView.builder(
        itemCount: iconlabel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(
              () {
                BlocProvider.of<NavBarCubit>(context).currentindex = index;
                BlocProvider.of<NavBarCubit>(context).widgetFromBottomNavBar();
              },
            );
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, top: 7.h, right: 4.w),
                child: Icon(
                  listoficon[index],
                  size: widget.size.width * .060,
                  color: index ==
                          BlocProvider.of<NavBarCubit>(context).currentindex
                      ? kpraimaryColor
                      : Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: Text(
                  iconlabel[index],
                  style: TextStyle(
                      fontSize: 12,
                      color: index ==
                              BlocProvider.of<NavBarCubit>(context).currentindex
                          ? kpraimaryColor
                          : Colors.grey),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 1550),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(
                    bottom: index ==
                            BlocProvider.of<NavBarCubit>(context).currentindex
                        ? widget.size.width * .0
                        : 0,
                    right: widget.size.width * 0.038,
                    left: widget.size.width * .038),
                width: widget.size.width * .128,
                height:
                    index == BlocProvider.of<NavBarCubit>(context).currentindex
                        ? widget.size.width * .010
                        : 0,
                decoration: const BoxDecoration(
                  color: kpraimaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<IconData> listoficon = [
  CupertinoIcons.home,
  FontAwesomeIcons.shop,
  FontAwesomeIcons.fireBurner,
  CupertinoIcons.chat_bubble,
  CupertinoIcons.settings
];
List<String> iconlabel = const [
  'Home',
  'Shop',
  'Kitchen',
  'Chat',
  'Settings',
];
