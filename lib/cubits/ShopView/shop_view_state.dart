part of 'shop_view_cubit.dart';

@immutable
sealed class ShopViewState {}

final class ShopViewInitial extends ShopViewState {}

final class Isloading extends ShopViewState {}

final class Isuccsess extends ShopViewState {}

final class Isfailure extends ShopViewState {}
