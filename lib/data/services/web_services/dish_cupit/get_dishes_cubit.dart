import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:healthapp/data/models/dish_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'get_dishes_state.dart';

class GetDishesCubit extends Cubit<GetDishesState> {
  GetDishesCubit() : super(GetDishesInitial());
  List<dynamic> listforonedish = [];

  Future<List<dynamic>> getdishes() async {
    emit(loading());

    http.Response response = await http.get(Uri.parse(
        'https://healthapp-2a7fc-default-rtdb.firebaseio.com/healthApp/dishes.json'));
    List<dynamic> data = jsonDecode(response.body);
    print(response.body);

    for (int index = 0; index < data.length; index++) {
      listforonedish.add(Dishes.fromJson(data[index]));
    }
    if (response.statusCode == 200) {
      emit(success());
      return listforonedish;
    } else {
      emit(failure());
      throw Exception(
          'there is an exception with statsCode ${response.statusCode}');
    }
  }
}
