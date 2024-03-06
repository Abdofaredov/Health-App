import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/constants.dart';
import 'package:healthapp/core/custom_mini_textformfiled.dart';
import 'package:healthapp/core/custombutten.dart';
import 'package:healthapp/cubits/UserRecord_Cubit/user_record_cubit.dart';
import 'package:healthapp/cubits/auth_cupit/authcupit_cubit.dart';
import 'package:healthapp/data/models/user.dart';
import 'package:healthapp/helper/validate_Email.dart';
import 'package:healthapp/helper/validate_password.dart';
import 'package:healthapp/main_app.dart';
import 'package:healthapp/views/auth/logIn_view/widgets/stackforLogo.dart';
import 'package:healthapp/views/auth/signUp_view/verifyEmailPage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class rigestrtionPage extends StatelessWidget {
  const rigestrtionPage({super.key});
  static String rigestrtionId = 'rigestrtionPage';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ColumnForRigtertionView(),
    );
  }
}

class ColumnForRigtertionView extends StatefulWidget {
  const ColumnForRigtertionView({
    super.key,
  });

  @override
  State<ColumnForRigtertionView> createState() =>
      _ColumnForRigtertionViewState();
}

TextEditingController emailcontroller = TextEditingController();
TextEditingController passcontroller = TextEditingController();
late String email, password;
bool isloadig = false;
GlobalKey<FormState> formstateforregister = GlobalKey<FormState>();

class _ColumnForRigtertionViewState extends State<ColumnForRigtertionView> {
  @override
  Widget build(BuildContext context) {
    var controllers = BlocProvider.of<UserRecordCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isloadig = true;
        } else if (state is AuthSucsess) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Succsess!!',
            desc: state.sucsessmessage,
            btnOkOnPress: () async {
              final user = Usermodel(
                  firstname: controllers.firstName!.text,
                  lastname: controllers.lastname!.text,
                  birthdate: controllers.birthdate!.text,
                  sexual: controllers.sexual!.text,
                  phoneNumber: controllers.phonenumber!.text,
                  email: emailcontroller.text);
              BlocProvider.of<UserRecordCubit>(context).addUser(user);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return VerifyEmailPage();
              }));
              const Duration(seconds: 3);
              // Navigator.pop(context);
              // Navigator.pop(context);
            },
          ).show();
          const Duration(seconds: 2);
          isloadig = false;
        } else if (state is AuthFailure) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Erorr',
            desc: state.errorMessage,
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();

          isloadig = false;
        }
      },
      builder: (context, state) {
        //todo:navigator to login view when state is success
        return ModalProgressHUD(
          inAsyncCall: isloadig,
          child: Form(
            key: formstateforregister,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height / 3.5,
                      child: Stack(
                        children: [
                          StackForlogo(
                            top: 75.h,
                            left: MediaQuery.sizeOf(context).width / 2.7,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      CustomMinitextformfield(
                        onChanged: (data) {
                          emailcontroller.text = data!;
                        },
                        validator: (value) {
                          return validateEmail(value);
                        },
                        controller: emailcontroller,
                        hintText: 'البريد الإلكتروني',
                        width: 400.w,
                      ),
                      CustomMinitextformfield(
                        onChanged: (data) {
                          password = data!;
                        },
                        validator: (value) {
                          return validatePassword(value, passcontroller);
                        },
                        controller: passcontroller,
                        obscureText: true,
                        width: 400.w,
                        hintText: 'كلمة السر ',
                      ),
                      CustomMinitextformfield(
                        validator: (val) {
                          bool confirmPassword =
                              RegExp(passcontroller.text).hasMatch(val!);
                          if (!confirmPassword) {
                            return 'password not matching';
                          } else {
                            return null;
                          }
                        },
                        width: 400.w,
                        hintText: 'تأكيد كلمة السر ',
                      ),
                      MainCustomButtontransparentbackground(
                          child: 'تسجيل',
                          onpressd: () {
                            if (formstateforregister.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).Signup(
                                  email: emailcontroller.text,
                                  password: password);
                            }
                          },
                          bordercolor: kthirthColor.value,
                          backgroundcolor: kthirthColor,
                          textcolor: Colors.white),
                      MainCustomButtontransparentbackground(
                          child: 'تسجيل الدخول بواسطة جوجل',
                          onpressd: () async {
                            // ignore: unused_local_variable
                            UserCredential user =
                                await BlocProvider.of<AuthCubit>(context)
                                    .signInWithGoogle();
                            if (FirebaseAuth.instance.currentUser != null) {
                              final user = Usermodel(
                                  firstname: controllers.firstName!.text,
                                  lastname: controllers.lastname!.text,
                                  birthdate: controllers.birthdate!.text,
                                  sexual: controllers.sexual!.text,
                                  phoneNumber: controllers.phonenumber!.text,
                                  email: emailcontroller.text);
                              BlocProvider.of<UserRecordCubit>(context)
                                  .addUser(user);

                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacementNamed(
                                  context, mainapp.id);
                            } else {
                              // ignore: use_build_context_synchronously
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Erorr',
                                desc: "some Thing went wrong",
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              ).show();
                            }
                          },
                          bordercolor: kthirthColor.value,
                          backgroundcolor: const Color(0xffFAFAFA),
                          textcolor: Colors.black54),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 100,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'أمتلك حساب بالفعل ',
                            style: TextStyle(color: kthirthColor, fontSize: 18),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showsnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message.toString()),
      ),
    );
  }
}
