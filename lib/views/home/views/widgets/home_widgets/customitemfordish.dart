import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthapp/constants.dart';
import 'package:healthapp/data/models/dish_model.dart';
import 'package:healthapp/views/home/views/widgets/home_widgets/custmors_Action_OnPost.dart';
import 'package:healthapp/views/home/views/widgets/home_widgets/custom_button_for_home.dart';

class Customitemfordich extends StatefulWidget {
  const Customitemfordich({super.key, required this.oneDish});
  final Dishes oneDish;
  @override
  State<Customitemfordich> createState() => _CustomitemfordichState();
}

class _CustomitemfordichState extends State<Customitemfordich> {
  bool clickedOnNature = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 0.h, 8.w, 8.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: kthirthColor.withOpacity(.3),
                    blurRadius: 10,
                    offset: const Offset(.2, 10),
                    spreadRadius: .1),
              ],
            ),
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
                        child: Image.asset(
                          "assets/images/test.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0.h,
                        child: clickedOnNature
                            ? Container(
                                width: 180,
                                decoration:
                                    const BoxDecoration(color: kpraimaryColor),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15.h, horizontal: 20),
                                  child: Column(
                                    children: [
                                      Text('id:${widget.oneDish.id}'),
                                      Text(
                                          "name :${widget.oneDish.name.toString()} "),
                                      Text('cal: ${widget.oneDish.cal}'),
                                      Text('price:${widget.oneDish.price}'),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(.2),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomrsActionOnPost(
                          icon: FontAwesomeIcons.heartCirclePlus,
                          coloricon: Colors.red,
                          text: 'Favorite by : 15',
                        ),
                        CustomrsActionOnPost(
                          icon: FontAwesomeIcons.buyNLarge,
                          coloricon: kpraimaryColor,
                          text: "Requests : 151",
                        )
                      ],
                    ),
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            CustomButtontransparentbackground(
                              minWidth: 10.w,
                              onLongPress: () {
                                clickedOnNature = true;
                                setState(() {});
                              },
                              bordercolor: Colors.white.withOpacity(.5).value,
                              width: MediaQuery.of(context).size.width / 2.14,
                              backgroundcolor: kpraimaryColor,
                              textcolor: Colors.white.withOpacity(.7),
                              onpressd: () {
                                clickedOnNature = false;
                                setState(() {});
                              },
                              child: 'nature',
                            ),
                            CustomButtontransparentbackground(
                              width: MediaQuery.of(context).size.width / 2.14,
                              minWidth: 50.w,
                              onpressd: () {},
                              bordercolor: kpraimaryColor.withOpacity(.5).value,
                              backgroundcolor: Colors.white.withOpacity(.5),
                              textcolor: kpraimaryColor,
                              child: 'Datiles',
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: -20.h,
                        left: 130.w,
                        child: CustomButtontransparentbackground(
                          width: 100,
                          circuller: 50,
                          horizontal: 0.w,
                          minWidth: 20.w,
                          onpressd: () {},
                          bordercolor: Colors.transparent.value,
                          backgroundcolor:
                              Color(kpraimaryColor.value).withOpacity(.2),
                          textcolor: Colors.transparent.withOpacity(.7),
                          child: 'More',
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
