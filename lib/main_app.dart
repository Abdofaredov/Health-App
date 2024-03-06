import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/core/bottom_nav_bar.dart';
import 'package:healthapp/cubits/navBarCubit/cubit/nav_bar_cubit_cubit.dart';
import 'package:healthapp/views/home/views/chatView.dart';
import 'package:healthapp/views/home/views/homeView.dart';
import 'package:healthapp/views/home/views/kitchenView.dart';
import 'package:healthapp/views/home/views/settingscreen.dart';
import 'package:healthapp/views/home/views/shopView.dart';

class mainapp extends StatefulWidget {
  const mainapp({super.key});
  static const String id = '';
  @override
  State<mainapp> createState() => _mainappState();
}

class _mainappState extends State<mainapp> {
  @override
  void initState() {
    body = const homeView();
    super.initState();
  }

  Widget? body = const homeView();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          if (state is Home) {
            body = const homeView();
          } else if (state is Shop) {
            print(state);

            body = const shopView();
          } else if (state is Kitchen) {
            body = const kitchenView();
          } else if (state is Chat) {
            body = const chatView();
          } else if (state is Settings) {
            body = const settingView();
          }
          return Scaffold(
            bottomNavigationBar: MyCustomBottomNavBar(
              size: size,
            ),
            body: body,
          );
        },
      ),
    );
  }
}
