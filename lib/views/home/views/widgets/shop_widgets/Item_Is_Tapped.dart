import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/constants.dart';
import 'package:healthapp/data/models/item_model.dart';

class itemtapped extends StatefulWidget {
  const itemtapped({super.key, required this.itemtap});
  final item itemtap;
  @override
  State<itemtapped> createState() => _itemtappedState();
}

class _itemtappedState extends State<itemtapped> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          appbar(widget.itemtap),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    itemInfo('name : ', widget.itemtap.name.toString(), 1),
                    dviderlength(160),
                    itemInfo('price : ', widget.itemtap.price.toString(), 1),
                    dviderlength(260),
                    itemInfo('cal : ', widget.itemtap.cal.toString(), 1),
                    dviderlength(270),
                    widget.itemtap.desc.toString().isEmpty
                        ? Container()
                        : itemInfo(
                            'desc : ', widget.itemtap.desc.toString(), 3),
                    dviderlength(30),
                    Container(
                      height: 700,
                    )
                  ],
                )),
          ]))
        ],
      ),
    );
  }
}

Widget appbar(item itemtap) {
  return SliverAppBar(
    expandedHeight: 600,
    pinned: true,
    stretch: true,
    backgroundColor: kpraimaryColor,
    flexibleSpace: FlexibleSpaceBar(
      title: Padding(
        padding: const EdgeInsets.only(right: 200),
        child: Text(
          itemtap.name!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      background: Hero(
          tag: itemtap.id!,
          child: Image.asset(
            'assets/images/testShopCard.png',
            fit: BoxFit.cover,
          )),
    ),
  );
}

Widget itemInfo(String title, String value, int? maxLines) {
  return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 1,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: kpraimaryColor, fontSize: 22),
        ),
        TextSpan(
          text: value,
          style: const TextStyle(color: kscoundryColor, fontSize: 18),
        )
      ]));
}

Widget dviderlength(double? length) {
  return Divider(
    height: 20.h,
    color: kpraimaryColor,
    thickness: 1,
    endIndent: length,
  );
}
