import 'package:cook/data/database_helper.dart';
import 'package:cook/models/food.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider() {
    getAllFoods();
  }
  TextEditingController foodTitleController = TextEditingController();
  TextEditingController foodWayController = TextEditingController();
  TextEditingController foodComponentController = TextEditingController();
  TextEditingController foodImgController = TextEditingController();
  bool isFavorites = false;
  changeIsFavoriteOnNewFoodScreen() {
    isFavorites = !isFavorites;
    notifyListeners();
  }

  List<Food> allFoods = [];
  List<Food> favoriteFoods = [];
  List<Food> infavoritesFoods = [];

  fillFoodsLists(List<Food> foods) {
    allFoods = foods;
    favoriteFoods = foods.where((element) => element.isFavorites).toList();

    notifyListeners();
  }

  insertNewFood() async {
    Food food = Food(
        name: foodTitleController.text,
        isFavorites: isFavorites,
        component: foodComponentController.text,
        way: foodWayController.text,
        image: foodImgController.text);
    print("food is ${food.name}");
    await DatabaseHelper.databaseHelper.insertNewFood(food);
    getAllFoods();
  }

  getAllFoods() async {
    List<Food> allFoods = await DatabaseHelper.databaseHelper.getAllFoods();
    fillFoodsLists(allFoods);
  }

  updateFood(Food food) async {
    food.isFavorites = !food.isFavorites;
    await DatabaseHelper.databaseHelper.updateOneFood(food);
    getAllFoods();
  }

  deleteFood(Food food) async {
    await DatabaseHelper.databaseHelper.deleteOneFood(food);
    getAllFoods();
  }
}
