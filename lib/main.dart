import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/camera_screen.dart';
import 'package:project/screens/contacts_screen.dart';
import 'package:project/screens/display_picture.dart';
import 'package:project/screens/main_screen.dart';
import 'package:project/screens/maps_screen.dart';
import 'package:project/screens/settings_screen.dart';
import 'dart:async';

import 'package:project/utilities/db_helper.dart';
import 'package:project/utilities/settings_change_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/utilities/constants.dart' as Constants;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  final DataBaseHelper dataBaseHelper = DataBaseHelper();

  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsChangeNotifier(
          userName:
              sharedPreferences.getString(Constants.USER_NAME_KEY) ?? "Guest",
          language: sharedPreferences.getBool(Constants.LANGUAGE_KEY)),
      child: MyApp(firstCamera, dataBaseHelper),
    ),
  );
}

class MyApp extends StatelessWidget {
  CameraDescription firstCamera;
  DataBaseHelper dataBaseHelper;

  MyApp(this.firstCamera, this.dataBaseHelper);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsChangeNotifier>(builder:
        (context, SettingsChangeNotifier settingsChangeNotifier, child) {
      return MaterialApp(
        theme: ThemeData.dark(),
        initialRoute: "/",
        routes: {
          '/': (context) => MainScreen(
                camera: firstCamera,
                dataBaseHelper: dataBaseHelper,
                username: settingsChangeNotifier.getUserName,
              ),
          '/camera': (context) => TakePictureScreen(camera: firstCamera),
          '/settings': (context) => SettingsScreen(),
          '/displaypics': (context) => DisplayPictureScreen(),
          '/maps': (context) => MapsScreen(),
          '/contacts': (context) => ContactsScreen(),
        },
      );
    });
  }
}
