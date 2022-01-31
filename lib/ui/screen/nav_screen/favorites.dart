import 'package:cook/providers/database_provider.dart';
import 'package:cook/ui/screen/menu/cooking_method.dart';
import 'package:cook/ui/widget/food_card.dart';
import 'package:cook/ui/widget/search_bar.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';
import '../new_food.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Expanded(
                    child: Text(
                      "food".tr(),
                      style: screen,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SearchBar(
                //title: "Search Food",
                ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                children: [
                  Consumer<DatabaseProvider>(
                      builder: (context, providerInstance, x) {
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: providerInstance.favoriteFoods.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IndividualItem(
                                            food: providerInstance
                                                .favoriteFoods[index],
                                          )),
                                );
                              },
                              child: FoodCard(
                                image: Image.asset(
                                  "assets/images/food1.png",
                                  fit: BoxFit.fill,
                                ),
                                food: providerInstance.favoriteFoods[index],
                              ),
                            ),
                          );
                        });
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
