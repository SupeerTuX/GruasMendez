//Modelos de datos para el screen cliente
import 'package:flutter/material.dart';
import 'package:mrd_interfaz/models/Temas.dart';

class FormController {
  List<TextEditingController> controller = List(11);
  List<TextInputTheme> theme = List(11);

  FormController() {
    for (var i = 0; i < controller.length; i++) {
      controller[i] = TextEditingController();
    }

    for (var i = 0; i < theme.length; i++) {
      theme[i] = inputThemeFail;
    }
  }
}

FormController formController = new FormController();

//Datos capturados por la pantalla del cliente
class ClienteDataModel {
  Map data = {
    'folio': '',
    'reporte': '',
    'fecha': '',
    'hora': '',
    'direccion': '',
    'inventario': '',
    'marca': '',
    'modelo': '',
    'tipo': '',
    'color': '',
    'placas': '',
    'serie': '',
    'propietario': '',
    'llaves': '',
    'telefono': '',
    'grua': '',
    'claveOperador': '',
    'autoridad': '',
  };
}

ClienteDataModel clienteDataModel = new ClienteDataModel();
