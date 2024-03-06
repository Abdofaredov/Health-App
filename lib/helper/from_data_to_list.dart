import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/data/services/web_services/dish_cupit/get_dishes_cubit.dart';

// ignore: non_constant_identifier_names
void fromDataToList(GetDishesState state, BuildContext context,
    List<dynamic> ListOfdishes, List<dynamic> oneDish) {
  if (state is success) {
    ListOfdishes = BlocProvider.of<GetDishesCubit>(context).listforonedish;
    for (int i = 0; i < ListOfdishes.length; i++) {
      oneDish = ListOfdishes;
    }
  }
}
