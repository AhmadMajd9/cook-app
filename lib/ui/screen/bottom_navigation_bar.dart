import 'package:cook/ui/screen/nav_screen/menu_screen.dart';
import 'package:cook/ui/screen/nav_screen/favorites.dart';
import 'package:cook/ui/screen/nav_screen/setting.dart';
import 'package:flutter/material.dart';

class BottomNavBarV2 extends StatefulWidget {
  @override
  _BottomNavBarV2State createState() => _BottomNavBarV2State();
}

class _BottomNavBarV2State extends State<BottomNavBarV2> {
  int currentIndex = 0;
  var pages = [
    MenuScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];
  var _appPageController = PageController();

  setBottomBarIndex(int index) {
    setState(() {
      currentIndex = index;
    });
    _appPageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      //  backgroundColor: Colors.white.withAlpha(100),
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: pages,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        controller: _appPageController,
      ),
      bottomNavigationBar: Container(
      
        width: size.width,
        height: 80,
        child: Stack(
          //overflow: Overflow.visible,
          children: [
            CustomPaint(
              size: Size(size.width, 80),
              painter: BNBCustomPainter(),
            ),
            Center(
              heightFactor: 0.6,
              child: FloatingActionButton(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.home), // Analyze Button
                  elevation: 10,
                  onPressed: () {
                    setBottomBarIndex(0);
                  }),
            ),
            Container(
              width: size.width,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite_rounded,
                      color: currentIndex == 1
                          ?Colors.orange : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      setBottomBarIndex(1);
                    },
                    splashColor: Colors.white,
                  ),
                  Container(
                    width: size.width * 0.20,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: currentIndex == 3
                            ? Colors.orange : Colors.grey.shade400,
                      ),
                      onPressed: () {
                        setBottomBarIndex(3);
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      currentIndex = value;
    });
    _appPageController.jumpToPage(value);
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 30, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
