import 'package:flutter/material.dart';
import 'package:healthapp/constants.dart';

class customUnAcativeCard extends StatelessWidget {
  const customUnAcativeCard({
    super.key,
    this.type = '',
    this.isSelcted = false,
    this.onTap,
  });
  final String type;
  final bool isSelcted;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return isSelcted == false
        ? Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
            child: Card(
              clipBehavior: Clip.none,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 75,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: kscoundryColor.withOpacity(.2),
                            blurRadius: 10,
                            spreadRadius: .100,
                            offset: const Offset(4, 10))
                      ],
                      color: kpraimaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    textAlign: TextAlign.center,
                    type.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
                ),
              ),
            ),
          )
        : Acativecard(type: type);
  }
}

class Acativecard extends StatelessWidget {
  const Acativecard({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.none,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Container(
        height: 75,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: kscoundryColor.withOpacity(.2),
              blurRadius: 10,
              spreadRadius: 3,
              offset: const Offset(4, 10))
        ], color: kpraimaryColor, borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(
          type.toUpperCase(),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }
}
