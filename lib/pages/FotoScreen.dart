import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FotoScreen extends StatefulWidget {
  @override
  _FotoScreenState createState() => _FotoScreenState();
}

class _FotoScreenState extends State<FotoScreen> {
  var args;
  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context).settings.arguments;
    //print(args);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args['titulo']),
        backgroundColor: Colors.black,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: PhotoView(
            imageProvider: FileImage(File(args['ruta'])),
          )),
    );
  }
}
