import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/constants.dart';
import 'package:healthapp/cubits/ShopView/shop_view_cubit.dart';
import 'package:healthapp/core/customAppbar.dart';
import 'package:healthapp/views/home/views/widgets/shop_widgets/sections_ListView.dart';

class shopView extends StatefulWidget {
  const shopView({super.key});
  static String id = 'shopView';

  @override
  State<shopView> createState() => _shopViewState();
}

@override
class _shopViewState extends State<shopView> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ShopViewCubit>(context).getFish();
    BlocProvider.of<ShopViewCubit>(context).getProteins();
    BlocProvider.of<ShopViewCubit>(context).getcarpohydrate();
    BlocProvider.of<ShopViewCubit>(context).getVega();
    BlocProvider.of<ShopViewCubit>(context).getmilCerealsAndLegumes();
    BlocProvider.of<ShopViewCubit>(context).getfatsAndHealthyOils();
    BlocProvider.of<ShopViewCubit>(context).getmilkProducts();
    BlocProvider.of<ShopViewCubit>(context).getsupplemnts();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> pitem = BlocProvider.of<ShopViewCubit>(context)
        .listFromindextothrowtoListOfPersention()
        .toList();

    return Scaffold(
      backgroundColor: kpraimaryColor.withOpacity(.5),
      body: Column(
        children: [
          const SafeArea(child: CustomAppBar()),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: sectionsText.length,
                          padding: const EdgeInsets.only(top: 0),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                                onTap: () {
                                  BlocProvider.of<ShopViewCubit>(context)
                                      .listFromindextothrowtoListOfPersention();
                                  BlocProvider.of<ShopViewCubit>(context)
                                      .currentindex = index;
                                  sectionsText[index];
                                  setState(() {});
                                },
                                child: customUnAcativeCard(
                                  type: sectionsText[index],
                                  isSelcted:
                                      BlocProvider.of<ShopViewCubit>(context)
                                              .currentindex ==
                                          index,
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 270,
                  child: Builder(builder: (context) {
                    return GridView.builder(
                        itemCount: BlocProvider.of<ShopViewCubit>(context)
                            .listFromindextothrowtoListOfPersention()
                            .length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 30, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return BlocProvider.of<ShopViewCubit>(context)
                              .shopSection(
                                  BlocProvider.of<ShopViewCubit>(context)
                                      .currentindex,
                                  pitem[index]);
                        });
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
