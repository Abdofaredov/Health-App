part of 'get_dishes_cubit.dart';

@immutable
sealed class GetDishesState {}

final class GetDishesInitial extends GetDishesState {}

// ignore: camel_case_types
final class loading extends GetDishesState {}

// ignore: camel_case_types
final class success extends GetDishesState {}

// ignore: camel_case_types
final class failure extends GetDishesState {}
