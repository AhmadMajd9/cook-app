import 'package:cook/constant.dart';
import 'package:cook/providers/database_provider.dart';
import 'package:cook/ui/screen/bottom_navigation_bar.dart';
import 'package:cook/ui/screen/menu/cooking_method.dart';
import 'package:cook/ui/screen/new_food.dart';
import 'package:cook/ui/widget/food_card.dart';
import 'package:cook/ui/widget/search_bar.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
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
                Consumer<DatabaseProvider>(
                    builder: (context, providerInstance, x) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: providerInstance.allFoods.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IndividualItem(
                                          food:
                                              providerInstance.allFoods[index],
                                        )),
                              );
                            },
                            child: FoodCard(
                              image: Image.asset(
                                "assets/images/food1.png",
                                fit: BoxFit.fill,
                              ),
                              food: providerInstance.allFoods[index],
                            ),
                          ),
                        );
                      });
                }),
                // SizedBox(
                //   height: 5,
                // ),
                // FoodCard(
                //   image: Image.asset(
                //     "assets/images/apple_pie.jpg",
                //     fit: BoxFit.cover,
                //   ),
                //   name: "Dark Chocolate Cake",
                //   // shop: "Cakes by Tella",
                //   // rating: "4.7",
                // ),
              ],
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: BottomNavBarV2(

          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewFoodScreen()),
          );
        },
      ),
    );
  }
}
