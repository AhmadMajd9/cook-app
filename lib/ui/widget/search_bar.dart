import 'package:cook/constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          color: Color(0xFFF2F2F2),
        ),
        child: TextField(
          cursorColor:Colors.orange,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search , color: Colors.orange,),
            hintText: "search".tr(),
            hintStyle: Search,
          
          ),
        ),
      ),
    );
  }
}
