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

class CardCustomContent {
  String _titulo;
  String _subtitulo;
  String _tooltip;
  String _campo;
  CardCustomTheme _theme;

  CardCustomContent({
    String titulo,
    String subtitulo,
    String tooltip,
    String campo,
    CardCustomTheme theme,
  }) {
    this._titulo = titulo;
    this._subtitulo = subtitulo;
    this._tooltip = tooltip;
    this._campo = campo;
    this._theme = theme;
  }

  String get titulo => _titulo;
  set titulo(String titulo) => this._titulo = titulo;

  String get subtitulo => _subtitulo;
  set subtitulo(String subtitulo) => this._subtitulo = subtitulo;

  String get tooltip => _tooltip;
  set tooltip(String tooltip) => this._tooltip = tooltip;

  String get campo => _campo;
  set campo(String campo) => this._campo = campo;

  CardCustomTheme get theme => _theme;
  set theme(CardCustomTheme theme) => this._theme = theme;
}

CardCustomContent fechaHoraContenido = CardCustomContent(
  titulo: 'Fecha y Hola',
  subtitulo: 'No se ha ingresado la fecha y hora',
  tooltip: 'Capture la fecha y la hora',
  campo: '',
  theme: themeFail,
);

CardCustomContent direccionContenido = CardCustomContent(
  titulo: 'Direccion',
  subtitulo: 'Capture la direccion del arrastre',
  tooltip: 'Capture la ubicacion',
  campo: '',
  theme: themeFail,
);

CardCustomContent inventarioContenido = CardCustomContent(
  titulo: 'Motivo de inventario',
  subtitulo: 'Capture el motivo del inventario',
  tooltip: 'Elija el motivo del inventario',
  campo: '',
  theme: themeFail,
);

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
