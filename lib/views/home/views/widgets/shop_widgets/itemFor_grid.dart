import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/constants.dart';
import 'package:healthapp/data/models/item_model.dart';
import 'package:healthapp/views/home/views/widgets/shop_widgets/Item_Is_Tapped.dart';

class itemForGrid extends StatelessWidget {
  const itemForGrid({
    super.key,
    required this.image,
    this.bottom,
    this.right,
    this.clipBehavior,
    required this.oneitem,
  });
  final String image;
  final double? bottom;
  final double? right;
  final Clip? clipBehavior;
  final item oneitem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return itemtapped(itemtap: oneitem);
        }));
      },
      child: Hero(
        tag: oneitem.id!,
        child: Card(
          color: kpraimaryColor.withOpacity(.5),
          elevation: 10,
          child: GridTile(
            // ignore: sort_child_properties_last
            child: Stack(
              clipBehavior: clipBehavior ?? Clip.none,
              children: [
                Positioned(
                  child: Image.asset(
                    image,
                  ),
                ),
                Positioned(
                  bottom: bottom ?? -10,
                  right: right ?? 20.w,
                  left: 20.w,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Image.asset(
                        'assets/images/testShopCard.png',
                        height: 250,
                        width: 80,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            footer: Container(
              width: double.infinity,
              color: Colors.black.withOpacity(.5),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              alignment: Alignment.bottomCenter,
              child: Text(
                // ignore: unnecessary_string_interpolations
                // oneitem.name.toString(),,
                oneitem.name.toString(),
                style: const TextStyle(
                    height: 1.3, color: kpraimaryColor, fontSize: 16),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
