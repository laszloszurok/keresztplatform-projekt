import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/models/base64_img.dart';

class ImageListScreen extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  final List<Base64Image> imageList;

  ImageListScreen(this.imageList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of images in database"),
      ),
      body: Container(
        child: ListView.builder(
          controller: scrollController,
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return Center(
              child: Card(
                child: Image.memory(base64Decode(imageList[index].base64str), width: 250,),
              ),
            );
          },
        ),
      ),
    );
  }
}
