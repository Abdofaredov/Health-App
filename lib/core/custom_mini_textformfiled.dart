import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/constants.dart';

class CustomMinitextformfield extends StatelessWidget {
  const CustomMinitextformfield({
    super.key,
    required this.hintText,
    this.width,
    this.readonly,
    this.onTap,
    this.controller,
    this.filled,
    this.keyboardType,
    this.obscureText,
    this.validator,
    this.onChanged,
  });

  final bool? filled;
  final String hintText;
  final double? width;
  final bool? readonly;
  final void Function()? onTap;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: SizedBox(
        width: width ?? 200,
        child: TextFormField(
          onChanged: onChanged,
          validator: validator ??
              (val) {
                if (val!.isEmpty) {
                  return ' Enter data is requaierd ';
                } else {
                  return null;
                }
              },
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          controller: controller,
          onTap: onTap,
          readOnly: readonly ?? false,
          textAlign: TextAlign.end,
          cursorColor: Color(kpraimaryColor.value),
          decoration: InputDecoration(
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.red)),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.red)),
            filled: filled,
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Color(kscoundryColor.value))),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Color(kpraimaryColor.value),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
