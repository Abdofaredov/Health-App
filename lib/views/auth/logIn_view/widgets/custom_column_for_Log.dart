import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/constants.dart';
import 'package:healthapp/core/custom_mini_textformfiled.dart';
import 'package:healthapp/core/custombutten.dart';
import 'package:healthapp/cubits/auth_cupit/authcupit_cubit.dart';
import 'package:healthapp/helper/validate_Email.dart';
import 'package:healthapp/helper/validate_password.dart';
import 'package:healthapp/views/auth/logIn_view/widgets/stackforLogo.dart';
import 'package:healthapp/views/auth/signUp_view/sign_Up_view.dart';
import 'package:healthapp/main_app.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomColumnLogView extends StatefulWidget {
  const CustomColumnLogView({super.key});

  @override
  State<CustomColumnLogView> createState() => _CustomColumnLogViewState();
}

TextEditingController _emailcontroller = TextEditingController();
final TextEditingController _passcontroller = TextEditingController();
final GlobalKey<FormState> formState = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
bool isloadingforlogin = false;
String? email, password;

class _CustomColumnLogViewState extends State<CustomColumnLogView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingforsignin) {
          isloadingforlogin = true;
        }
        if (state is AuthSucsessforsignin) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'Succsess!!',
              desc: state.sucsessmessage,
              btnOkOnPress: () async {
                await Navigator.pushReplacementNamed(context, mainapp.id);
              },
            ).show();
            isloadingforlogin = false;
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.rightSlide,
              title: 'please verify !!',
              desc: 'you must going to gmail and verify',
            ).show();
          }
        }

        if (state is AuthFailureforsignin) {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'error404!!',
                  desc: state.errorMessageforsignin,
                  btnCancelOnPress: () {})
              .show();
          isloadingforlogin = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloadingforlogin,
          child: Form(
            key: formState,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 200.h,
                      child: StackForlogo(
                        left: MediaQuery.sizeOf(context).width / 2.7,
                        top: MediaQuery.sizeOf(context).height / 8.5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: CustomMinitextformfield(
                      onChanged: (data) {
                        email = data!;
                      },
                      validator: (value) {
                        return validateEmail(value);
                      },
                      controller: _emailcontroller,
                      width: 450.w,
                      hintText: 'رقم الهاتف او البريد الإلكتروني',
                    ),
                  ),
                  CustomMinitextformfield(
                    onChanged: (data) {
                      password = data!;
                    },
                    validator: (value) {
                      return validatePassword(value, _passcontroller);
                    },
                    controller: _passcontroller,
                    width: 450,
                    hintText: 'كلمة السر',
                  ),
                  MainCustomButtontransparentbackground(
                    child: 'تسجيل الدخول',
                    onpressd: () async {
                      if (formState.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context)
                            .signin(email: email!, password: password!);
                      }
                    },
                    bordercolor: kpraimaryColor.value,
                    backgroundcolor: kscoundryColor,
                    textcolor: Colors.white,
                  ),
                  TextButton(
                      onPressed: () async {
                        if (email == '') {
                          AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'error',
                                  desc:
                                      'you should enter your mail even we can help you',
                                  btnOkOnPress: () {})
                              .show();
                          return;
                        }
                        try {
                          await FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email!);
                          // ignore: use_build_context_synchronously
                          AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.rightSlide,
                                  desc:
                                      'check your gmail to reset your password ',
                                  btnOkOnPress: () {})
                              .show();
                        } on FirebaseAuthException catch (e) {
                          print(e.code);
                          print(e.message);
                          // ignore: use_build_context_synchronously
                          AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.warning,
                                  animType: AnimType.rightSlide,
                                  desc: 'this user is not found !!',
                                  btnOkOnPress: () {})
                              .show();
                        }
                      },
                      child: const Text(
                        'هل نسيت كلمة السر ؟',
                        style: TextStyle(color: Colors.black),
                      )),
                  const SizedBox(height: 20),
                  MainCustomButtontransparentbackground(
                    child: 'إنشاء حساب جديد',
                    onpressd: () {
                      Navigator.pushNamed(context, SignUpview.signUpID);
                    },
                    bordercolor: kscoundryColor.value,
                    backgroundcolor: Colors.white,
                    textcolor: kscoundryColor,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
