
import 'package:cook/constant.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key key,
    @required String name,
    @required String count,
    @required Widget imageShape,
  })  : _name = name,
        _count = count,
        _imageShape = imageShape,
        super(key: key);

  final String _name;
  final String _count;
  final Widget _imageShape;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFB6B7B7),
                offset: Offset(0, 0),
                blurRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _name,
                style: cooking,
                textAlign: TextAlign.center,
                    ),
          
            ],
          ),
        ),
        SizedBox(
          width: 120,
          height: 80,
          child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
            child: _imageShape,
          ),
        ),
        SizedBox(
          height: 80,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin:EdgeInsets.only(left: 20),
              height: 40,
              width: 40,
              decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      color: Color(0xFFB6B7B7),
                      offset: Offset(0, 2),
                      blurRadius: 9,
                    )
                  ]),
              child: Icon(Icons.arrow_forward_ios , color: Colors.orange)
            ),
          ),
        ),
      ],
    );
  }
}

