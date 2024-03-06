import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/constants.dart';
import 'package:healthapp/core/custom_button.dart';
import 'package:healthapp/cubits/auth_cupit/authcupit_cubit.dart';
import 'package:healthapp/views/auth/logIn_view/logIn_view.dart';

class settingView extends StatefulWidget {
  const settingView({super.key});
  static String id = 'settingView';
  @override
  State<settingView> createState() => _settingViewState();
}

class _settingViewState extends State<settingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            'الاعدادت',
            style: TextStyle(fontSize: 40, color: kpraimaryColor),
          ),
          const SizedBox(
            height: 200,
          ),
          CustomButton(
            onpressd: () async {
              await FirebaseAuth.instance.signOut();
              // ignore: use_build_context_synchronously
              BlocProvider.of<AuthCubit>(context).signout();
              // BlocProvider.of<NavBarCubit>(context).currentindex = 0;
              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, LoginView.loginViewID);
            },
            child: 'sign out',
          )
        ],
      ),
    );
  }
}
