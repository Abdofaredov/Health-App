import 'package:flutter/material.dart';
import 'package:healthapp/views/home/views/widgets/home_widgets/customitemfordish.dart';

class VerticalListView extends StatelessWidget {
  const VerticalListView({
    super.key,
    required this.ListOfdishes,
    required this.oneDish,
  });

  final List ListOfdishes;
  final List? oneDish;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: ListOfdishes.length,
        itemBuilder: (context, index) {
          return Customitemfordich(oneDish: oneDish![index]);
        });
  }
}
