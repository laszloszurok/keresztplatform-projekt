import 'package:flutter/widgets.dart';

class WelcomeText extends StatelessWidget {
  var username;

  WelcomeText({
    Key key,
    String this.username,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello $username!"),
        ],
      ),
    );
  }
}