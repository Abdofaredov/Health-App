part of 'nav_bar_cubit_cubit.dart';

@immutable
sealed class NavBarState {}

final class NavBarCubitInitial extends NavBarState {}

final class Home extends NavBarState {}

final class Shop extends NavBarState {}

final class Kitchen extends NavBarState {}

final class Chat extends NavBarState {}

final class Settings extends NavBarState {}
