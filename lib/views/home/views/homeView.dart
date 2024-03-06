import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/data/services/web_services/dish_cupit/get_dishes_cubit.dart';
import 'package:healthapp/views/home/views/widgets/home_widgets/Home_When_State_IsSucces.dart';
import 'package:healthapp/views/home/views/widgets/home_widgets/Home_When_State_Is_Loading.dart';
import 'package:healthapp/views/home/views/widgets/home_widgets/Home_when_state_isFailure.dart';

class homeView extends StatefulWidget {
  const homeView({super.key});
  static String id = 'homeView';
  @override
  State<homeView> createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetDishesCubit>(context).getdishes();
  }

  List<dynamic>? oneDish;
  List<dynamic> listOfdishes = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetDishesCubit, GetDishesState>(
      listener: (context, state) {
        if (state is success) {
          listOfdishes =
              BlocProvider.of<GetDishesCubit>(context).listforonedish;
          for (int i = 0; i < listOfdishes.length; i++) {
            oneDish = listOfdishes;
          }
        } else if (state is loading) {}
      },
      builder: (context, state) {
        if (state is loading) {
          return const HomeWhenStateIsLoading();
        } else if (state is success) {
          return HomeWhenStateIsSucces(
              listOfdishes: listOfdishes, oneDish: oneDish);
        } else if (state is failure) {
          return const HomeWhenStateIsFailure();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
