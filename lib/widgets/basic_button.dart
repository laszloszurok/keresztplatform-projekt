import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BasicButton extends StatelessWidget {
  String name, route;
  BasicButton({this.name, this.route});

  @override
  Widget build (BuildContext context) {
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
                Navigator.pushNamed(context, route);
              },
              child: Text(name),
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
}