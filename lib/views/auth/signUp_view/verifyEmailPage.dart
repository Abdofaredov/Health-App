// ignore: file_names
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/views/home/views/homeView.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});
  static String id = 'VerifyEmailPage';

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailverifyed = false;
  Timer? timer;
  @override
  void initState() {
    isEmailverifyed = FirebaseAuth.instance.currentUser!.emailVerified;
    super.initState();
    if (!isEmailverifyed) {
      sendEmailverifiction();
      timer = Timer.periodic(const Duration(seconds: 3), (_) {
        checkEmailverified();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailverified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(
      () {
        isEmailverifyed = FirebaseAuth.instance.currentUser!.emailVerified;
      },
    );
    if (isEmailverifyed) timer!.cancel();
  }

  Future sendEmailverifiction() async {
    final user = FirebaseAuth.instance.currentUser;
    await user!.sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isEmailverifyed
          ? const homeView()
          : const Center(
              child: Column(
                children: [Text("please verifing your Email ")],
              ),
            ),
    );
  }
}
