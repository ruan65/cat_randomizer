import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class CatDetailedScreen extends StatelessWidget {
  final String url;

  CatDetailedScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
          color: Colors.black,
          child: PhotoView(
            imageProvider: NetworkImage(url),
          )),
    );
  }
}
