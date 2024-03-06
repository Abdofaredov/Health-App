import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/data/models/item_model.dart';
import 'package:healthapp/helper/api.dart';
import 'package:healthapp/views/home/views/widgets/shop_widgets/itemFor_grid.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'shop_view_state.dart';

class ShopViewCubit extends Cubit<ShopViewState> {
  ShopViewCubit() : super(ShopViewInitial());
  int currentindex = 0;
  Widget shopSection(int currentIndex, item oneitem) {
    if (currentIndex == 0) {
      return itemForGrid(
        clipBehavior: Clip.none,
        image: 'assets/images/frameshopcard.jpg',
        oneitem: oneitem,
      );
    } else if (currentIndex == 1) {
      return itemForGrid(
        clipBehavior: Clip.none,
        image: 'assets/images/fresh-fruits-isolated-white-background.jpg',
        oneitem: oneitem,
      );
    } else if (currentIndex == 2) {
      return itemForGrid(
        image: 'assets/images/frameshopcard.jpg',
        oneitem: oneitem,
      );
    } else if (currentIndex == 3) {
      return itemForGrid(
        image: 'assets/images/frameshopcard.jpg',
        oneitem: oneitem,
      );
    } else if (currentIndex == 4) {
      return itemForGrid(
        image: 'assets/images/frameshopcard.jpg',
        oneitem: oneitem,
      );
    } else if (currentIndex == 5) {
      return itemForGrid(
        image: 'assets/images/frameshopcard.jpg',
        oneitem: oneitem,
      );
    } else if (currentIndex == 6) {
      return itemForGrid(
        image: 'assets/images/frameshopcard.jpg',
        oneitem: oneitem,
      );
    } else if (currentIndex == 7) {
      return itemForGrid(
        image: 'assets/images/frameshopcard.jpg',
        oneitem: oneitem,
      );
    } else if (currentIndex == 8) {
      return itemForGrid(
        image: 'assets/images/frameshopcard.jpg',
        oneitem: oneitem,
      );
    } else {
      return Container();
    }
  }

//list for storage maps in them//
  List<dynamic> fruitsItems = [];
  List<dynamic> fishItems = [];
  List<dynamic> proteinsItems = [];
  List<dynamic> carpohydrateItems = [];
  List<dynamic> milkproductsItems = [];
  List<dynamic> cerealsItems = [];
  List<dynamic> fatsItems = [];
  List<dynamic> supplmentsItems = [];
  List<dynamic> veganitems = [];
  //lists for storage opjects in them\\
  List<item> listoutputformsupplemnts = [];
  List<item> listoutputfromFish = [];
  List<item> listItemsfroproteins = [];
  List<item> listveganItems = [];
  List<item> listItemsforcarpohydrate = [];
  List<item> listItemsforfats = [];
  List<item> listItemsformilkproudcts = [];
  List<item> listItemsforcereals = [];

  Future<List<dynamic>> getVega() async {
    emit(Isloading());
    String uri =
        "https://healthapp-2a7fc-default-rtdb.firebaseio.com/healthApp/vega.json";
    http.Response response = await http.get(Uri.parse(uri));
    veganitems = jsonDecode(response.body);

    for (int i = 0; i < veganitems.length; i++) {
      listveganItems.add(item.fromJson(veganitems[i]));
      print('list of vegan items = ${response.body}');
    }
    if (response.statusCode == 200) {
      emit(Isuccsess());
      return listveganItems;
    } else {
      emit(Isfailure());
      return throw Exception(
          'there is an exception with statsCode ${response.statusCode}');
    }
  }

  Future<List<dynamic>> getsupplemnts() async {
    String url =
        "https://healthapp-2a7fc-default-rtdb.firebaseio.com/healthApp/supplments.json";
    supplmentsItems = await api().get(uri: url);

    for (int i = 0; i < supplmentsItems.length; i++) {
      listoutputformsupplemnts.add(item.fromJson(supplmentsItems[i]));
    }
    return listoutputformsupplemnts;
  }

  Future<List<dynamic>> getFish() async {
    String url =
        "https://healthapp-2a7fc-default-rtdb.firebaseio.com/healthApp/Fish.json";
    fishItems = await api().get(uri: url);

    for (int i = 0; i < fishItems.length; i++) {
      listoutputfromFish.add(item.fromJson(fishItems[i]));
    }
    return listoutputfromFish;
  }

  Future<List<dynamic>> getProteins() async {
    String url =
        "https://healthapp-2a7fc-default-rtdb.firebaseio.com/healthApp/Proteins.json";
    proteinsItems = await api().get(uri: url);
    for (int i = 0; i < proteinsItems.length; i++) {
      listItemsfroproteins.add(item.fromJson(proteinsItems[i]));
    }
    return listItemsfroproteins;
  }

  Future<List<dynamic>> getcarpohydrate() async {
    String url =
        "https://healthapp-2a7fc-default-rtdb.firebaseio.com/healthApp/carpohydrate.json";
    carpohydrateItems = await api().get(uri: url);
    for (int i = 0; i < carpohydrateItems.length; i++) {
      listItemsforcarpohydrate.add(item.fromJson(carpohydrateItems[i]));
    }
    return listItemsforcarpohydrate;
  }

  Future<List<dynamic>> getfatsAndHealthyOils() async {
    String url =
        "https://healthapp-2a7fc-default-rtdb.firebaseio.com/healthApp/fatsAndHealthyOils.json";
    fatsItems = await api().get(uri: url);
    for (int i = 0; i < fatsItems.length; i++) {
      listItemsforfats.add(item.fromJson(fatsItems[i]));
    }
    return listItemsforfats;
  }

  Future<List<dynamic>> getmilkProducts() async {
    String url =
        "https://healthapp-2a7fc-default-rtdb.firebaseio.com/healthApp/milkProducts.json";
    milkproductsItems = await api().get(uri: url);
    for (int i = 0; i < milkproductsItems.length; i++) {
      listItemsformilkproudcts.add(item.fromJson(milkproductsItems[i]));
    }
    return listItemsformilkproudcts;
  }

  Future<List<dynamic>> getmilCerealsAndLegumes() async {
    String url =
        "https://healthapp-2a7fc-default-rtdb.firebaseio.com/healthApp/CerealsAndLegumes.json";
    cerealsItems = await api().get(uri: url);
    for (int i = 0; i < cerealsItems.length; i++) {
      listItemsforcereals.add(item.fromJson(cerealsItems[i]));
    }
    return listItemsforcereals;
  }

  List<dynamic> listFromindextothrowtoListOfPersention() {
    if (currentindex == 0) {
      return listveganItems;
    } else if (currentindex == 1) {
      return fruitsItems;
    } else if (currentindex == 2) {
      return listoutputfromFish;
    } else if (currentindex == 3) {
      return listItemsfroproteins;
    } else if (currentindex == 4) {
      return listItemsforcarpohydrate;
    } else if (currentindex == 5) {
      return listItemsformilkproudcts;
    } else if (currentindex == 6) {
      return listItemsforcereals;
    } else if (currentindex == 7) {
      return listItemsforfats;
    } else if (currentindex == 8) {
      return listoutputformsupplemnts;
    } else {
      return [];
    }
  }
}
