import 'package:flutter/material.dart';
import 'package:healthapp/core/customAppbar.dart';

class HomeWhenStateIsFailure extends StatelessWidget {
  const HomeWhenStateIsFailure({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Center(
            child: RichText(
                text: const TextSpan(
                    children: [],
                    text:
                        "some thing went wrong pleas check your intrnet And try again ")),
          )
        ],
      ),
    );
  }
}
