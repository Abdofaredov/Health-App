import 'package:flutter/material.dart';
import 'package:healthapp/constants.dart';
import 'package:healthapp/views/auth/onpoarding_view.dart/pageView.dart';
import 'package:healthapp/views/home/views/widgets/home_widgets/custom_button_for_home.dart';

class OnpoardingScreen extends StatelessWidget {
  const OnpoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          splachScreen(),
          Positioned(
            bottom: MediaQuery.of(context).size.width * 1.7,
            right: MediaQuery.of(context).size.width * .10,
            child: const Text(
              'skip',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kpraimaryColor),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .1,
            right: MediaQuery.of(context).size.width / 2.7,
            child: CustomButtontransparentbackground(
              minWidth: 5,
              horizontal: 60,
              width: 80,
              circuller: 12,
              onpressd: () {},
              bordercolor: kpraimaryColor.value,
              backgroundcolor: kpraimaryColor,
              textcolor: Colors.white,
              child: 'Next',
            ),
          )
        ],
      ),
    );
  }
}
