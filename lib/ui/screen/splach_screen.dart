
import 'package:cook/ui/screen/bottom_navigation_bar.dart';
import 'package:cook/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplachScreen extends StatefulWidget {

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  NavigationFunction(context) async {
    await Future.delayed(Duration(seconds: 3
    ));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavBarV2()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NavigationFunction(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Image.asset(
            'assets/images/splashIcon.jpg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
        ),
        Center(
          child: Lottie.asset('assets/animation/food.json' ,),
        ),
      ],
    ));
  }}


