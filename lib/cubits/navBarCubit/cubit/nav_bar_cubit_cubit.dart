import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'nav_bar_cubit_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarCubitInitial());
  static NavBarCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  void widgetFromBottomNavBar() {
    switch (currentindex) {
      case 0:
        emit(Home());
        break;

      case 1:
        emit(Shop());
        break;
      case 2:
        emit(Kitchen());
        break;

      case 3:
        emit(Chat());
        break;
      case 4:
        emit(Settings());
        break;
    }
  }
}
