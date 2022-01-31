import 'dart:io';

import 'package:cook/providers/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NewFoodScreen extends StatefulWidget {
  @override
  State<NewFoodScreen> createState() => _NewFoodScreenState();
}

class _NewFoodScreenState extends State<NewFoodScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile _image;

  getimageFromGallery() async {
    _image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Food'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                getimageFromGallery();
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
                child: _image == null
                    ? Icon(
                        Icons.fastfood,
                        size: 50,
                        color: Colors.white,
                      )
                    : Image.file(File(_image.path)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller:
                  Provider.of<DatabaseProvider>(context).foodTitleController,
              decoration: InputDecoration(
                  label: Text('food title'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: 10,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              controller: Provider.of<DatabaseProvider>(context)
                  .foodComponentController,
              decoration: InputDecoration(
                  label: Text('food component'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: 10,
              minLines: 1,
              controller:
                  Provider.of<DatabaseProvider>(context).foodWayController,
              decoration: InputDecoration(
                  label: Text('food way'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            CheckboxListTile(
              value: Provider.of<DatabaseProvider>(context).isFavorites,
              onChanged: (value) {
                Provider.of<DatabaseProvider>(context, listen: false)
                    .changeIsFavoriteOnNewFoodScreen();
              },
              title: Text('I have complete this food'),
            ),
            InkWell(
              onTap: () async {
                Provider.of<DatabaseProvider>(context, listen: false)
                    .foodImgController
                    .text = _image.path;
                await Provider.of<DatabaseProvider>(context, listen: false)
                    .insertNewFood();
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Add The Food',
                  style: TextStyle(color: Colors.white),
                ),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
