import 'package:flutter/material.dart';
import 'package:healthapp/constants.dart';
import 'package:healthapp/core/customAppbar.dart';

class HomeWhenStateIsLoading extends StatelessWidget {
  const HomeWhenStateIsLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Center(
              child: CircularProgressIndicator(
                color: kpraimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
