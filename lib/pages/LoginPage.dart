import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mrd_interfaz/models/DataModel.dart';
import 'package:mrd_interfaz/widget/TextLogin.dart';
import 'package:mrd_interfaz/widget/VerticalText.dart';
import 'package:mrd_interfaz/widget/InputMail.dart';
import 'package:mrd_interfaz/widget/PasswordInput.dart';
import 'package:mrd_interfaz/widget/ButtonLogin.dart';

Future<Post> fetchPost({String region}) async {
  final response =
      await http.get('https://consulta.ustgm.net/mrd/public/api/folio/$region');

  if (response.statusCode == 201) {
    // Si la llamada al servidor fue exitosa, analiza el JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final bool error;
  final String msg;
  final int code;

  Post({this.error, this.msg, this.code});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      error: json['error'],
      msg: json['msg'],
      code: json['code'],
    );
  }
}

GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
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
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 10.0),
              child: Text(
                'Seleccione El Corralon',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Corralon(),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 8.0),
              child: Text(
                'Tipo De Vehiculo',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            TipoVehiculo(),
            ButtonLogin(
              accion: () {
                if (dropdownCorralon == 'Seleccione' ||
                    dropdownCorralon.isEmpty) {
                  scaffoldState.currentState.showSnackBar(new SnackBar(
                      content: Text('Debe seleccionar un corralon')));
                } else if (dropdownTipo == 'Seleccione' ||
                    dropdownTipo.isEmpty) {
                  scaffoldState.currentState.showSnackBar(new SnackBar(
                      content: Text('Debe seleccionar un tipo de vehiculo')));
                } else {
                  _showMaterialDialog();
                }
                //Navigator.of(context).pushNamed('/main');
              },
            ),
          ],
        ),
      ),
    );
  }

  _showMaterialDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () {},
        child: AlertDialog(
          title: Text("Solicitando Folio: $dropdownCorralon"),
          content: Text("Espere mientras se solicita el folio"),
          actions: <Widget>[
            FutureBuilder<Post>(
              future: fetchPost(region: dropdownCorralon),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return RequestOK(
                    folio: snapshot.data.msg,
                  );
                } else if (snapshot.hasError) {
                  return RequestFail(
                    error: snapshot.error.toString(),
                  );
                }
                // Por defecto, muestra un loading spinner
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RequestOK extends StatefulWidget {
  final String folio;

  RequestOK({this.folio});

  @override
  _RequestOKState createState() => _RequestOKState();
}

class _RequestOKState extends State<RequestOK> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Folio generado correctamente',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            'Folio: ${this.widget.folio}',
            style: TextStyle(color: Colors.red[400]),
            textAlign: TextAlign.end,
          ),
          FlatButton(
              onPressed: () {
                setState(() {
                  infoModel.reporte = this.widget.folio;
                });
                Navigator.of(context).pop();
                if (dropdownTipo == 'Automovil') {
                  //Guardar el folio y region en el mapa
                  mapCliente['Folio'] = this.widget.folio;
                  if(dropdownCorralon == 'Poza Rica'){
                    mapCliente['Region'] = 'poza_rica';
                  }else{
                    mapCliente['Region'] = dropdownCorralon.toLowerCase();
                  }
                  
                  Navigator.of(context).pushNamed('/main');
                } else if (dropdownTipo == 'Motos') {
                  //Guardar el folio y region en el mapa
                  mapClienteMoto['Folio'] = this.widget.folio;

                  if(dropdownCorralon == 'Poza Rica'){
                    mapClienteMoto['Region'] = 'poza_rica_motos';
                  }else{
                    mapClienteMoto['Region'] =
                      dropdownCorralon.toLowerCase() + '_motos';
                  }
                  Navigator.of(context).pushNamed('/mainMotos');
                }
              },
              child: Text('Continuar')),
        ],
      ),
    );
  }
}

class RequestFail extends StatelessWidget {
  final String error;
  RequestFail({this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Se ha producido un error'),
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Salir')),
        ],
      ),
    );
  }
}

class Corralon extends StatefulWidget {
  @override
  _CorralonState createState() => _CorralonState();
}

String dropdownCorralon = 'Seleccione';

class _CorralonState extends State<Corralon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: DropdownButton<String>(
        value: dropdownCorralon,
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.white,
        ),
        iconSize: 28,
        elevation: 16,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        underline: Container(
          height: 2,
          color: Colors.white,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownCorralon = newValue;
          });
        },
        items: <String>[
          'Seleccione',
          'Coatepec',
          'Coatzacoalcos',
          'Cordoba',
          'Minatitlan',
          'Poza Rica',
          'Puebla',
          'Veracruz',
          'Xalapa'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

String dropdownTipo = 'Seleccione';

class TipoVehiculo extends StatefulWidget {
  @override
  _TipoVehiculoState createState() => _TipoVehiculoState();
}

class _TipoVehiculoState extends State<TipoVehiculo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: DropdownButton<String>(
        value: dropdownTipo,
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.white,
        ),
        iconSize: 28,
        elevation: 16,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        underline: Container(
          height: 2,
          color: Colors.white,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownTipo = newValue;
          });
        },
        items: <String>[
          'Seleccione',
          'Automovil',
          'Motos',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
