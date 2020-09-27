//Modelos de datos para el screen cliente
import 'package:flutter/material.dart';
import 'package:mrd_interfaz/models/Temas.dart';

class FormController {
  List<TextEditingController> controller = List(17);
  List<TextInputTheme> theme = List(17);

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

//******************************************* */

class CardBodyController {
  List<CardBodyTheme> bodyTheme = new List(5);

  CardBodyController() {
    for (var i = 0; i < bodyTheme.length; i++) {
      bodyTheme[i] = cardBodyThemeFail;
    }
  }
}

CardBodyController theme = new CardBodyController();

//Clase para validacion de los formulario
class Validacion {
  bool _cliente;
  bool _exterior;
  bool _interior;
  bool _motor;
  bool _fotos;

  Validacion({
    bool cliente,
    bool exterior,
    bool interior,
    bool motor,
    bool fotos,
  }) {
    this._cliente = cliente;
    this._exterior = exterior;
    this._interior = interior;
    this._motor = motor;
    this._fotos = fotos;
  }

  bool get cliente => _cliente;
  set cliente(bool cliente) => this._cliente = cliente;

  bool get exterior => _exterior;
  set exterior(bool exterior) => this._exterior = exterior;

  bool get interior => _interior;
  set interior(bool interior) => this._interior = interior;

  bool get motor => _motor;
  set motor(bool motor) => this._motor = motor;

  bool get fotos => _fotos;
  set fotos(bool fotos) => this._fotos = fotos;
}

//Clase de respuesta del servidor post
class ResponseReporte {
  final bool error;
  final String msg;
  final int code;

  ResponseReporte({this.error, this.msg, this.code});

  factory ResponseReporte.fromJson(Map<String, dynamic> json) {
    return ResponseReporte(
      error: json['error'],
      msg: json['msg'],
      code: json['code'],
    );
  }
}

class InfoModel {
  String _reporte;
  String _info;
  int _tickets;

  InfoModel({reporte, info, tickets}) {
    this._reporte = reporte;
    this._info = info;
    this._tickets = tickets;
  }

  String get reporte => _reporte;
  set reporte(String reporte) => this._reporte = reporte;

  String get info => _info;
  set info(String info) => this._info = info;

  int get tickets => _tickets;
  set tickets(int tickets) => this._tickets = tickets;
}

InfoModel infoModel =
    new InfoModel(reporte: 'XXXX', info: 'En Captura', tickets: 0);

Map<String, bool> validacionReporte = {'Datos': false, 'Fotos': false};

Map<String, bool> mapValidacion = {
  'Cliente': false,
  'Exterior': false,
  'Interior': false,
  'Motor': false,
  'Fotos': false,
};

//ClienteDataModel clienteDataModel = new ClienteDataModel();

Map mapCliente = {
  'Region': '',
  'Folio': 'XXXX',
  'Fecha': '',
  'Direccion': '',
  'MotivoInventario': '',
  'VahiculoMarca': '',
  'Modelo': '',
  'Tipo': '',
  'Color': '',
  'Placas': '',
  'NoSerie': '',
  'NombreConductor': '',
  'Llaves': 'No',
  'Telefono': '',
  'Grua': '',
  'ClaveOperador': '',
  'Solicitante': '',
};

//Mapa de datos exterior

Map mapExterior = {
  'DefensaDelantera': 'Si',
  'CarroceriaSinGolpes': 'Si',
  'Parrilla': 'Si',
  'Faros': 'Si', //! Eliminar
  'Cofre': 'Si',
  'Parabrisas': 'Si',
  'Limpiadores': 'Si',
  'Emblemas': '',
  'PortezuelaIzq': 'Si',
  'CristalLatIzq': 'Si',
  'Medallon': 'Si',
  'Cajuela': 'Si',
  'DefensaTrasera': 'Si',
  'PortezuelaDer': 'Si',
  'CristalLatDer': 'Si',
  'Antenas': '',
  'Espejos': '',
  'TaponesRuedas': 'Si',
  'TaponGasolina': 'Si',
  'SalpicaderaDer': 'Si',
  'SalpicaderaIzq': 'Si',
  //
  'PuertaTraseraDer': 'Si',
  'PuertaTraseraIzq': 'Si',
  'FaroDerecho': 'Si',
  'FaroIzquierdo': 'Si',
  'CalaveraDerecha': 'Si',
  'CalaveraIzquierda': 'Si',
  'Reflejantes': '',
};

//Mapa de datos interior
Map mapInterior = {
  'Tablero': 'Si',
  'Volante': 'Si',
  'Radio': 'Si',
  'EquipoSonido': 'Si',
  'Encendedor': 'Si',
  'Espejo': 'Si',
  'Asientos': '',
  'TapetesAlfombra': '',
  'TapetesHule': '',
  'Extintor': 'Si',
  'GatoYManeral': 'Si',
  'TrianguloDeSeguridad': 'Si',
  'Bocinas': '',
  'Luces': '',
  'Tag': 'Si',
  'VialPass': 'Si',
  'SimCard': 'Si',
  'MarcaLlantas': '',
  'MedidaLlantas': '',
  'CantidadLlantas': '',
};

//Mapa de datos motor
Map mapMotor = {
  'Radiador': 'Si',
  'Motoventilador': 'Si',
  'Alternador': 'Si',
  'CableDeBujias': 'Si',
  'Depurador': 'Si',
  'Carburador': 'Si',
  'FiltroAire': 'Si',
  'Inyectores': '',
  'Compresor': 'Si',
  'Computadora': 'Si',
  'Bateria': 'Si',
  'MarcaMotor': '',
  'TanqueGasolina': '0.0',
  'CargaConsistente': '',
  'Observaciones': '',
  "NombreEntrega": "Juan Perez",
  "NombreDeOficial": "Jose Perez",
  "NombreOperador": "Pedro Perez"
};

//Mapa de datos motor
Map mapReporteFotografico = {
  'img1': '',
  'img2': '',
  'img3': '',
  'img4': '',
  'img5': '',
  'img6': '',
  'img7': '',
  'img8': '',
};

Map<String, dynamic> mapTest = {
  "Region": "veracruz",
  "Folio": "VER015",
  "Fecha": "2020-03-04 17:00:00",
  "Direccion": "Luis Hidalgo Monroy #47 Xalapa Ver.",
  "MotivoInventario": "Mal Estacionado",
  "VahiculoMarca": "Mazda",
  "Tipo": "Sedan",
  "Modelo": "2007",
  "Color": "Gris",
  "Placas": "801AWD",
  "NoSerie": "SN12345678912345",
  "NombreConductor": "Hugo Mendoza Ramos",
  "Llaves": "Si",
  "Telefono": "2282536722",
  "Grua": "XAL001",
  "ClaveOperador": "G001",
  "Solicitante": "Transito del estado",
  "DefensaDelantera": "Bien",
  "CarroceriaSinGolpes": "Bien",
  "Parrilla": "Bien",
  "Faros": "Mal",
  "Cofre": "Mal",
  "Parabrisas": "Mal",
  "Limpiadores": "No Trae",
  "Emblemas": "No Trae",
  "PortezuelaIzq": "No Trae",
  "CristalLatIzq": "No Trae",
  "Medallon": "Bien",
  "Cajuela": "Bien",
  "DefensaTrasera": "Bien",
  "PortezuelaDer": "Bien",
  "CristalLatDer": "Bien",
  "Antenas": "Bien",
  "Espejos": "Mal",
  "TaponesRuedas": "Mal",
  "TaponGasolina": "Mal",
  "SalpicaderaDer": "Mal",
  "SalpicaderaIzq": "Mal",
  "Tablero": "Mal",
  "Volante": "No Trae",
  "Radio": "No Trae",
  "EquipoSonido": "No Trae",
  "Encendedor": "No Trae",
  "Espejo": "No Trae",
  "Asientos": "No Trae",
  "TapetesAlfombra": "No Trae",
  "TapetesHule": "No Trae",
  "Extintor": "No Trae",
  "GatoYManeral": "Bien",
  "TrianguloDeSeguridad": "Bien",
  "Bocinas": "Bien",
  "Luces": "Bien",
  "Tag": "Bien",
  "VialPass": "Bien",
  "SimCard": "Bien",
  "Radiador": "Bien",
  "Motoventilador": "Mal",
  "Alternador": "Mal",
  "CableDeBujias": "Mal",
  "Depurador": "Mal",
  "Carburador": "Mal",
  "FiltroAire": "Mal",
  "Inyectores": "Mal",
  "Compresor": "Mal",
  "Computadora": "Mal",
  "Bateria": "No Trae",
  "MarcaMotor": "LTH",
  "MarcaLlantas": "Goodyear",
  "MedidaLlantas": "R15",
  "CantidadLlantas": "5",
  "TanqueGasolina": "4",
  "CargaConsistente": "Carga de auto",
  "Observaciones": "Observaciones de operador",
  "NombreEntrega": "Juan Perez",
  "NombreDeOficial": "Jose Perez",
  "NombreOperador": "Pedro Perez"
};

Map<String, String> ticket = {};
