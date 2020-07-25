import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TextLogin extends StatefulWidget {
  @override
  _TextLoginState createState() => _TextLoginState();
}

class _TextLoginState extends State<TextLogin> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10),
      child: Container(
        //color
        height: 200,
        width: 300,
        child: Column(
          children: <Widget>[
            Container(
              height: 20,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Captura De Reportes:',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    '\nSistema de captura',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  Text(
                    '\nInicio De Sesion',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
