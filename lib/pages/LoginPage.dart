import 'package:flutter/material.dart';
import 'package:mrd_interfaz/widget/TextLogin.dart';
import 'package:mrd_interfaz/widget/VerticalText.dart';
import 'package:mrd_interfaz/widget/InputMail.dart';
import 'package:mrd_interfaz/widget/PasswordInput.dart';
import 'package:mrd_interfaz/widget/ButtonLogin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondoLogin.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.color)),
        ),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                VerticalText(),
                TextLogin(),
              ],
            ),
            InputMail(),
            PasswordInput(),
            ButtonLogin(),
          ],
        ),
      ),
    );
  }
}
