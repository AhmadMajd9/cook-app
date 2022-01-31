import 'dart:io';
import 'package:cook/data/database_helper.dart';
import 'package:cook/providers/database_provider.dart';
import 'package:cook/ui/screen/splach_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DatabaseHelper.databaseHelper.initDatabase();

  runApp(ChangeNotifierProvider<DatabaseProvider>(
    create: (context) {
      return DatabaseProvider();
    },
    child: EasyLocalization(
        supportedLocales: [Locale('en', ''), Locale('ar', '')],
        path: 'assets/langs', // <-- change the path of the translation files
        fallbackLocale: Locale('ar'),
        saveLocale: false,
        useOnlyLangCode: true,
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplachScreen(),
    );
  }
}
