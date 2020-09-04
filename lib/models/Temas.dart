//Clase para definir temas para las CARDS cuando ya esten vacias o tengan unformacion

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCustomTheme {
  CardCustomTheme({
    this.icon,
    this.iconColor,
    this.cardBackground,
  });

  IconData icon;
  Color iconColor;
  Color cardBackground;
}

final themeFail = CardCustomTheme(
  icon: Icons.error,
  iconColor: Colors.red,
  cardBackground: Colors.grey[200],
);

final themeOk = CardCustomTheme(
  icon: Icons.check_circle_outline,
  iconColor: Colors.green,
  cardBackground: Colors.greenAccent[100],
);

//****************************************** */

class CardBodyTheme {
  CardBodyTheme({this.cardColor, this.icono, this.iconoColor});
  Color cardColor;
  Color iconoColor;
  IconData icono;
}

final cardBodyThemeFail = CardBodyTheme(
  cardColor: Colors.grey[300],
  iconoColor: Colors.red,
  icono: Icons.error,
);

final cardBodyThemeOk = CardBodyTheme(
  cardColor: Colors.lightGreenAccent[100],
  iconoColor: Colors.tealAccent[400],
  icono: Icons.check_circle,
);

final cardBodyThemeLock = CardBodyTheme(
  cardColor: Colors.blue[200],
  iconoColor: Colors.grey,
  icono: Icons.lock,
);

//********************************************* */

class TextInputTheme {
  Color textInputColor;
  Color labelColor;

  TextInputTheme({this.labelColor, this.textInputColor});
}

final inputThemeOK = TextInputTheme(
  labelColor: Colors.greenAccent[700],
  textInputColor: Colors.black54,
);

final inputThemeFail = TextInputTheme(
  labelColor: Colors.redAccent[400],
  textInputColor: Colors.black54,
);
