import 'dart:io';

import 'package:cook/constant.dart';
import 'package:cook/models/food.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  const FoodCard({
    Key key,
    @required String name,
    // @required String rating,
    // @required String shop,
    @required Image image,
    this.food,
  })  : _name = name,
        // _rating = rating,
        // _shop = shop,
        _image = image,
        super(key: key);

  final String _name;
  // final String _rating;
  // final String _shop;
  final Image _image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.file(
              File(food.image),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.2),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 70,
              width: double.infinity,
              child: Text(
                food.name,
                style: foood,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
