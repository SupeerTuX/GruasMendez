import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mrd_interfaz/models/DataModel.dart';
import 'package:mrd_interfaz/models/Temas.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/CardHeader.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/CuerpoReporte.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/HeaderText.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/Info.dart';

Future<ResponseReporte> uploadReporte(Map data) async {
  final http.Response response = await http.post(
    'https://consulta.ustgm.net/mrd/public/api/reporte',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return ResponseReporte.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Desea Salir De La Aplicacion?'),
            content: new Text(
                'Si el reporte no se ha enviado, se perdera la informacion'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Salir'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('Cancelar'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        key: scaffoldState,
        appBar: AppBar(
          title: Text('Captura De Reporte'),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green[400],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MainBody(),
        ),
      ),
    );
  }
}

class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                HeaderText(),
                CardHeader(
                  uploadReporte: () {
                    //print(mapTest);
                    print(checkValidacion());
                    if (checkValidacion()) {
                      Map mapReporte = new Map();
                      mapReporte.addAll(mapCliente);
                      mapReporte.addAll(mapExterior);
                      mapReporte.addAll(mapInterior);
                      mapReporte.addAll(mapMotor);

                      /*
                      mapTest.forEach((key, value) {
                        print('$key: $value');
                      });
                      print('\n\n');
                      */

                      mapReporte.forEach((key, value) {
                        print('$key: $value');
                      });

                      _showMaterialDialog(mapReporte);
                    } else {
                      scaffoldState.currentState.showSnackBar(new SnackBar(
                          content: Text('Debe llenar los todos los datos')));
                    }
                    /*
                    uploadReporte().then((value) {
                      print('Code: ${value.code}');
                      print('Error: ${value.error}');
                      print('Msg: ${value.msg}');
                    });*/
                  },
                ),
                Info(),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 2,
            ),
            delegate: SliverChildListDelegate(
              [
                CardBody(
                  titulo: 'Cliente',
                  subtitulo: 'Captura los datos\ndel cliente',
                  tooltip: 'Datos del cliente sin capturar',
                  icono: Icons.playlist_add_check,
                  iconoFondo: Colors.orange,
                  iconoColor: Colors.white,
                  theme: theme.bodyTheme[0],
                  accion: () {
                    print('Card Cliente');
                    Navigator.of(context).pushNamed('/cliente').then((value) {
                      setState(() {
                        if (value == false || value == null) {
                          theme.bodyTheme[0] = cardBodyThemeFail;
                          mapValidacion['Cliente'] = false;
                        } else {
                          theme.bodyTheme[0] = cardBodyThemeOk;
                          mapValidacion['Cliente'] = true;
                        }
                      });
                    });
                  },
                ),
                //Captura de Informacion del exterior del auto
                CardBody(
                  titulo: 'Exterior',
                  subtitulo: 'Captura de datos\ndel exterior \ndel auto',
                  tooltip: 'Datos del exterior sin capturar',
                  icono: Icons.directions_car,
                  iconoFondo: Colors.greenAccent,
                  iconoColor: Colors.white,
                  theme: theme.bodyTheme[1],
                  accion: () {
                    print('Card Exterior');
                    Navigator.of(context).pushNamed('/exterior').then((value) {
                      setState(() {
                        if (value == false || value == null) {
                          theme.bodyTheme[1] = cardBodyThemeFail;
                          mapValidacion['Exterior'] = false;
                        } else {
                          theme.bodyTheme[1] = cardBodyThemeOk;
                          mapValidacion['Exterior'] = true;
                        }
                      });
                    });
                  },
                ),
                //Captura de Datos del interior del vehiculo
                CardBody(
                  titulo: 'Interior',
                  subtitulo: 'Captura de datos\ndel interior del auto',
                  tooltip: 'Datos del interior sin capturar',
                  icono: Icons.directions_car,
                  iconoFondo: Colors.cyan,
                  iconoColor: Colors.white,
                  theme: theme.bodyTheme[2],
                  accion: () {
                    print('Card Interior');
                    Navigator.of(context).pushNamed('/interior').then((value) {
                      setState(() {
                        if (value == false || value == null) {
                          theme.bodyTheme[2] = cardBodyThemeFail;
                          mapValidacion['Interior'] = false;
                        } else {
                          theme.bodyTheme[2] = cardBodyThemeOk;
                          mapValidacion['Interior'] = true;
                        }
                      });
                    });
                  },
                ),
                //Camputa de datos del Motor
                CardBody(
                  titulo: 'Motor',
                  subtitulo: 'Captura de datos\ndel motor del auto',
                  tooltip: 'Datos del interior sin capturar',
                  icono: Icons.settings,
                  iconoFondo: Colors.blueAccent,
                  iconoColor: Colors.white,
                  theme: theme.bodyTheme[3],
                  accion: () {
                    print('Card Motor');
                    Navigator.of(context).pushNamed('/motor').then((value) {
                      setState(() {
                        if (value == false || value == null) {
                          theme.bodyTheme[3] = cardBodyThemeFail;
                          mapValidacion['Motor'] = false;
                        } else {
                          theme.bodyTheme[3] = cardBodyThemeOk;
                          mapValidacion['Motor'] = true;
                        }
                      });
                    });
                  },
                ),
                //Reporte fotografico
                CardBody(
                  titulo: 'Fotos',
                  subtitulo: 'Captura de reporte\nfotografico',
                  tooltip: 'Datos del cliente sin capturar',
                  icono: Icons.camera_alt,
                  iconoFondo: Colors.purpleAccent,
                  iconoColor: Colors.white,
                  theme: theme.bodyTheme[4],
                  accion: () {
                    print('Captura de fotod');
                    Navigator.of(context).pushNamed('/fotos').then((value) {
                      setState(() {
                        if (value == false || value == null) {
                          theme.bodyTheme[4] = cardBodyThemeFail;
                          mapValidacion['Fotos'] = false;
                        } else {
                          theme.bodyTheme[4] = cardBodyThemeOk;
                          mapValidacion['Fotos'] = true;
                        }
                      });
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _showMaterialDialog(Map data) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () {},
        child: AlertDialog(
          title: Text("Subiendo Reporte"),
          content: Text("Espere mientras se sube el reporte"),
          actions: <Widget>[
            FutureBuilder<ResponseReporte>(
              future: uploadReporte(data),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ReporteOK(
                    folio: snapshot.data.msg,
                  );
                } else if (snapshot.hasError) {
                  return ReporteFail(
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

class ReporteOK extends StatelessWidget {
  final String folio;

  ReporteOK({this.folio});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Reporte guardado correctamente',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(
            this.folio,
            style: TextStyle(color: Colors.green),
            textAlign: TextAlign.end,
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Continuar'),
          ),
        ],
      ),
    );
  }
}

class ReporteFail extends StatelessWidget {
  final String error;
  ReporteFail({this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Se ha producido un error, intentelo nuevamente'),
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

bool checkValidacion() {
  bool validacion = true;

  mapValidacion.forEach((key, value) {
    if (value == false) {
      validacion = false;
    }
  });
  return validacion;
}
