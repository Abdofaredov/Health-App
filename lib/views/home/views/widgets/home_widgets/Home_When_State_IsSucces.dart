import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/core/customAppbar.dart';
import 'package:healthapp/views/home/views/widgets/home_widgets/Horizontal_Story_ListView.dart';
import 'package:healthapp/views/home/views/widgets/home_widgets/vertical_list_view.dart';

class HomeWhenStateIsSucces extends StatefulWidget {
  const HomeWhenStateIsSucces({
    super.key,
    required this.listOfdishes,
    required this.oneDish,
  });

  final List listOfdishes;
  final List? oneDish;

  @override
  State<HomeWhenStateIsSucces> createState() => _HomeWhenStateIsSuccesState();
}

class _HomeWhenStateIsSuccesState extends State<HomeWhenStateIsSucces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Colors.white.value),
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            Expanded(
              child: ListView(
                children: [
                  const HorizontalStoryListView(),
                  VerticalListView(
                      ListOfdishes: widget.listOfdishes,
                      oneDish: widget.oneDish)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
