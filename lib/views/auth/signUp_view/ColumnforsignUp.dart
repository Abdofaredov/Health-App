import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/constants.dart';

import 'package:healthapp/core/custom_mini_textformfiled.dart';
import 'package:healthapp/core/custom_text_with_Google_fonts.dart';
import 'package:healthapp/core/custombutten.dart';
import 'package:healthapp/cubits/UserRecord_Cubit/user_record_cubit.dart';
import 'package:healthapp/views/auth/signUp_view/widgets/column_radios.dart';
import 'package:healthapp/views/auth/signUp_view/rigestertion_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnforsignUp extends StatefulWidget {
  const ColumnforsignUp({super.key});

  @override
  State<ColumnforsignUp> createState() => _ColumnforsignUpState();
}

GlobalKey<FormState> formstate = GlobalKey<FormState>();

class _ColumnforsignUpState extends State<ColumnforsignUp> {
  @override
  Widget build(BuildContext context) {
    var controllers = BlocProvider.of<UserRecordCubit>(context);

    return Form(
      key: formstate,
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: TextwidgetWtihFontsGoogle(
                      chiled: 'أدخل اسمك ؟',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomMinitextformfield(
                      onChanged: (val) {
                        controllers.lastname!.text = val!;
                      },
                      hintText: ' الاسم الثاني  ',
                      controller: controllers.lastname,
                      width: 175.w,
                    ),
                  ),
                  Expanded(
                    child: CustomMinitextformfield(
                      onChanged: (val) {
                        controllers.firstName!.text = val!;
                      },
                      hintText: ' الاسم الاول  ',
                      controller: controllers.firstName,
                      width: 175.w,
                    ),
                  ),
                ],
              ),
              const TextwidgetWtihFontsGoogle(
                chiled: "ما تاريخ ميلادك ؟",
              ),
              CustomMinitextformfield(
                  onChanged: (val) {
                    controllers.birthdate!.text = val!;
                  },
                  filled: false,
                  controller: controllers.birthdate,
                  onTap: () {
                    _selectDate(context);
                    setState(() {});
                  },
                  readonly: true,
                  hintText: "تاريخ ميلادك",
                  width: 400.w),
              const TextwidgetWtihFontsGoogle(chiled: 'ما جنسك ؟'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
                child: const containersGenderRadios(),
              ),
              const TextwidgetWtihFontsGoogle(chiled: 'أدخل رقم الهاتف'),
              CustomMinitextformfield(
                onChanged: (val) {
                  controllers.phonenumber!.text = val!;
                },
                controller: controllers.phonenumber,
                keyboardType: TextInputType.phone,
                width: 350.w,
                hintText: "رقم الهاتف",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              MainCustomButtontransparentbackground(
                child: 'التالي',
                onpressd: () {
                  if (!formstate.currentState!.validate()) {
                    setState(() {});
                  } else {
                    Navigator.pushNamed(context, rigestrtionPage.rigestrtionId);
                  }
                },
                bordercolor: kthirthColor.value,
                backgroundcolor: kthirthColor,
                textcolor: Colors.white,
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'أمتلك حساب بالفعل ',
                      style: TextStyle(color: kthirthColor, fontSize: 18),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked != null) {
      setState(() {
        BlocProvider.of<UserRecordCubit>(context).birthdate!.text =
            '${_picked.month} / ${_picked.day} / ${_picked.year}';
      });
    }
  }
}
