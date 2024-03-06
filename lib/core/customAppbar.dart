import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/constants.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, this.vertical});
  final double? vertical;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

bool _isSearching = false;

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kpraimaryColor),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: widget.vertical ?? 8.h),
        child: _isSearching ? searchRow() : unSerachRow(),
      ),
    );
  }

  Row unSerachRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        customIconBottun(icons: FontAwesomeIcons.bars, onPressed: () {}),
        SizedBox(
          width: 300,
          height: 40,
          child: Row(
            children: [
              Text(
                'Healthy App',
                style: GoogleFonts.pacifico(
                  wordSpacing: 2,
                  textStyle: TextStyle(
                    wordSpacing: 2,
                    fontWeight: FontWeight.w100,
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              )
                  .animate()
                  .tint(color: Colors.white.withOpacity(.3))
                  .then(duration: const Duration(milliseconds: 800))
                  .shake(),
              FaIcon(
                FontAwesomeIcons.leaf,
                color: kthirthColor.withOpacity(.5),
              ),
            ],
          ),
        ),
        customIconBottun(
          onPressed: () {
            setState(() {
              _isSearching = true;
            });
          },
          icons: FontAwesomeIcons.magnifyingGlass,
        )
      ],
    );
  }

  Row searchRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        customIconBottun(
          icons: FontAwesomeIcons.bars,
          onPressed: () {},
        ),
        Container(
          decoration: BoxDecoration(),
          width: 300,
          height: 40,
          child: const TextField(),
        ),
        customIconBottun(
          onPressed: () {
            setState(() {
              _isSearching = false;
            });
          },
          icons: FontAwesomeIcons.magnifyingGlassArrowRight,
        )
      ],
    );
  }
}

class customIconBottun extends StatelessWidget {
  const customIconBottun({
    super.key,
    this.icons,
    required this.onPressed,
  });
  final IconData? icons;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kthirthColor.withOpacity(.2),
      child: IconButton(
        color: kthirthColor,
        onPressed: onPressed,
        icon: Icon(
          icons,
          color: Colors.white,
        ),
      ),
    );
  }
}
