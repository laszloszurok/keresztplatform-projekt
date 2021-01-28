import 'package:flutter/material.dart';
import 'package:project/utilities/settings_change_notifier.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();
  String username;

  SettingsScreen();

  _showInputPrompt(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Consumer<SettingsChangeNotifier>(
            builder: (context, SettingsChangeNotifier settingsChangeNotifier,
                    child) =>
                AlertDialog(
              title: Text("Change username"),
              content: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(hintText: "Username"),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    await _showFeedback(context);
                    username = _textEditingController.text;
                    settingsChangeNotifier.setUserName(username);
                    Navigator.pop(context);
                    Navigator.pop(context, username);
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          );
        });
  }

  _showFeedback(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("Username Saved"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showInputPrompt(context);
                    },
                    child: Text("Change username"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
