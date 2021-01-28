import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:project/models/base64_img.dart';
import 'package:project/screens/image_list_screen.dart';
import 'package:project/utilities/db_helper.dart';
import 'package:project/utilities/settings_change_notifier.dart';
import 'package:project/widgets/basic_button.dart';
import 'package:project/widgets/welcome_text.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final CameraDescription camera;
  final DataBaseHelper dataBaseHelper;
  String username;
  MainScreen(
      {Key key,
      @required this.camera,
      @required this.dataBaseHelper,
      @required this.username})
      : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState(
      camera: camera, dataBaseHelper: dataBaseHelper, username: username);
}

class _MainScreenState extends State {
  CameraDescription camera;
  DataBaseHelper dataBaseHelper;
  List<Base64Image> imageList;

  String username = "Guest";

  _MainScreenState({this.camera, this.dataBaseHelper, this.username});

  void getSavedImages() async {
    imageList = await dataBaseHelper.getModelsFromMapList();
    imageList = imageList.reversed.toList();
    setState(() {});
  }

  Widget settingsButton() {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(),
            flex: 1,
          ),
          Consumer<SettingsChangeNotifier>(
            builder: (context, SettingsChangeNotifier settingsChangeNotifier,
                    child) =>
                Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () async {
                  await Navigator.pushNamed(context, "/settings");
                  username = settingsChangeNotifier.getUserName;
                },
                child: Text("Settings"),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget imageListButton() {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(),
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageListScreen(imageList)));
              },
              child: Text("Stored images"),
            ),
          ),
          Expanded(
            child: SizedBox(),
            flex: 1,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getSavedImages();
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        child: Center (
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WelcomeText(username: username),
                BasicButton(name: 'Camera', route: '/camera'),
                imageListButton(),
                settingsButton(),
                BasicButton(name: "Google Maps", route: "/maps"),
                BasicButton(name: "Contacts", route: "/contacts"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
