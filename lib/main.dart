import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_app/core/constants/color_constants.dart';
import 'package:travel_app/core/constants/local_storage_helper.dart';
import 'package:travel_app/representation/screens/splash_screen.dart';
import 'package:travel_app/routes.dart';

void main() async {
  // define Hive and LocalStorageHelper
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: ' Travo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: ColorPalette.primaryColor,
            scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
            backgroundColor: ColorPalette.backgroundScaffoldColor),
        routes: routes,
        home: const SplashScreen());
  }
}
