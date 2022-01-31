import 'package:cook/constant.dart';
import 'package:cook/ui/screen/menu/food_screen.dart';
import 'package:cook/ui/widget/search_bar.dart';
import 'package:cook/ui/widget/menu_card_widget.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "menu".tr(),
                        style: screen,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SearchBar(),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 100,
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                              ),
                              color: Colors.orange),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FoodScreen()),
                                  );
                                },
                                child: MenuCard(
                                  imageShape: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      child: Image.asset(
                                        "assets/images/western2.jpg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  name: "food".tr(),
                                  count: "120",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MenuCard(
                                imageShape: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 70,
                                    width: 80,
                                    child: Image.asset(
                                      "assets/images/coffee2.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                name: "beverage".tr(),
                                count: "220",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.of(context)
                                  //     .pushNamed(DessertScreen.routeName);
                                },
                                child: MenuCard(
                                  imageShape: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      height: 70,
                                      width: 80,
                                      child: Image.asset(
                                        "assets/images/dessert.jpg",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  name: "desserts".tr(),
                                  count: "135",
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MenuCard(
                                imageShape: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    height: 70,
                                    width: 80,
                                    child: Image.asset(
                                      "assets/images/starter.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                name: "starters".tr(),
                                count: "25",
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
