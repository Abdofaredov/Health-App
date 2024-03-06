import 'package:flutter/material.dart';
import 'package:healthapp/constants.dart';

class splachScreen extends StatelessWidget {
  const splachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: PageView(
          children: const [
            pages(
                image: 'assets/images/welcome.png',
                boldtext: 'welcome sir ... ',
                text: 'blal'),
            pages(
                image: 'assets/images/cooking.png',
                boldtext: 'welcome sir ... ',
                text: 'blal'),
            pages(
                image: 'assets/images/chat.png',
                boldtext: 'welcome sir ... ',
                text: 'blal'),
            pages(
                image: 'assets/images/target.png',
                boldtext: 'welcome sir ... ',
                text: 'blal'),
          ],
        ),
      ),
    );
  }
}

class pages extends StatelessWidget {
  const pages(
      {super.key,
      required this.image,
      required this.boldtext,
      required this.text});
  final String image;
  final String boldtext;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 400,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          boldtext,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: kpraimaryColor),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, color: kpraimaryColor),
        )
      ],
    );
  }
}
