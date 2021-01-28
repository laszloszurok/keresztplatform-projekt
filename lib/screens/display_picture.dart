import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _byteImage = Base64Decoder().convert(imagePath);
    Widget image = Image.memory(_byteImage);
    return Scaffold(
      appBar: AppBar(title: Text('Picture Taken')),
      body: image,
    );
  }
}
