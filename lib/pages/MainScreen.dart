import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io';
import 'package:mrd_interfaz/models/DataModel.dart';
import 'package:mrd_interfaz/models/Temas.dart';
import 'package:mrd_interfaz/pages/Ticket.dart';
import 'package:mrd_interfaz/servicios/Servicios.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/CardHeader.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/CuerpoReporte.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/HeaderText.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/Info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

Future<ResponseReporte> uploadReporte(Map data) async {
  //Checamos el mapa de validacion
  var datos, fotos;

  //subiendo datos
  if (!validacionReporte['Datos']) {
    datos = await sendData(data);
  }

  //si los datos se subieron correctamente, enviamos las fotos
  if (!validacionReporte['Fotos']) {
    fotos = await sendImages(rutas: mapReporteFotografico, data: mapCliente);
  }

  //check si los datos y fotos se subieron correctamente
  if (validacionReporte['Datos'] && validacionReporte['Fotos']) {
    //Si los datos y fotos fueron subidos correctamente devolvemos
    //una instancia de la clase ResponseReporte
    ResponseReporte response = new ResponseReporte(
        code: 201, error: false, msg: 'Reporte enviado correctamente');
    return response;
  } else {
    //Si algun servicio fallo, salimos y damos el mensaje de error para
    //que el usuario lo intente nuevamente
    ResponseReporte response = new ResponseReporte(
        code: 401,
        error: true,
        msg: 'Ha ocurrido un error, Intentelo nuevamente');
    return response;
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
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
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
  BlueThermalPrinter bluetooth;
  String pathImage;
  bool formularioBloqueado = false;
  bool reporteEnviado = false;

  @override
  void initState() {
    bluetooth = BlueThermalPrinter.instance;
    initSavetoPath();
    super.initState();
  }

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
                    if (checkValidacion()) {
                      Map mapReporte = new Map();
                      mapReporte.addAll(mapCliente);
                      mapReporte.addAll(mapExterior);
                      mapReporte.addAll(mapInterior);
                      mapReporte.addAll(mapMotor);
                      //print(mapReporte);
                      if (!reporteEnviado) {
                        _showMaterialDialog(mapReporte);
                        print('test');
                      } else {
                        scaffoldState.currentState.showSnackBar(new SnackBar(
                          content: Text('El reporte ha sido enviado '),
                          action: SnackBarAction(
                              label: 'Ver Reporte',
                              onPressed: () async {
                                String url =
                                    'https://consulta.ustgm.net/mrd/web/reportes.php?Reportes[0][Folio]=${mapCliente['Folio']}&Region=${mapCliente['Region']}';
                                print(url);
                                if (await canLaunch(url)) {
                                  await launch(url);
                                }
                              }),
                        ));
                      }
                    } else {
                      scaffoldState.currentState.showSnackBar(new SnackBar(
                          content: Text('Debe capturar todos los campos')));
                    }
                  },
                  openReporte: () {},
                  btConfig: () {
                    Navigator.of(context).pushNamed('/btconfig');
                  },
                  printTicket: () {
                    if (checkValidacion()) {
                      _printTicket();
                    } else {
                      scaffoldState.currentState.showSnackBar(new SnackBar(
                          content: Text('Debe capturar todos los campos')));
                      return;
                    }
                  },
                ),
                Info(infoModel: infoModel),
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
                    if (formularioBloqueado) {
                      scaffoldState.currentState.showSnackBar(new SnackBar(
                          content: Text(
                              'Reporte enviado o impreso, no se puede editar')));
                      return;
                    }
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
                    if (formularioBloqueado) {
                      scaffoldState.currentState.showSnackBar(new SnackBar(
                          content: Text(
                              'Reporte enviado o impreso, no se puede editar')));
                      return;
                    }
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
                    if (formularioBloqueado) {
                      scaffoldState.currentState.showSnackBar(new SnackBar(
                          content: Text(
                              'Reporte enviado o impreso, no se puede editar')));
                      return;
                    }
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
                    if (formularioBloqueado) {
                      scaffoldState.currentState.showSnackBar(new SnackBar(
                          content: Text(
                              'Reporte enviado o impreso, no se puede editar')));
                      return;
                    }
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
                    if (formularioBloqueado) {
                      scaffoldState.currentState.showSnackBar(new SnackBar(
                          content: Text(
                              'Reporte enviado o impreso, no se puede editar')));
                      return;
                    }
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

  initSavetoPath() async {
    //read and write
    //image max 300px X 300px
    final filename = 'logo_ticket.png';
    var bytes = await rootBundle.load("assets/logo_ticket.png");
    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes, '$dir/$filename');
    setState(() {
      pathImage = '$dir/$filename';
    });
  }

  //write to app path
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  Future<bool> _printTicket() async {
    bool impresionOK = false;
    //SIZE
    // 0- normal size text
    // 1- only bold text
    // 2- bold with medium text
    // 3- bold with large text
    //ALIGN
    // 0- ESC_ALIGN_LEFT
    // 1- ESC_ALIGN_CENTER
    // 2- ESC_ALIGN_RIGHT
    bluetooth.isConnected.then((isConnected) {
      if (isConnected) {
        Ticket ticket = new Ticket();
        List<String> list = ticket.textHeader;

        //Header
        bluetooth.printCustom("TALLERES Y GRUAS MENDEZ", 3, 1);
        //Impresion de logo

        bluetooth.printImage(pathImage);
        //Cliente
        list.forEach((element) {
          List<String> sublist = [];
          sublist = ticket.format47Char(element);
          sublist.forEach((e) {
            bluetooth.printCustom(e, 0, 1);
          });
        });
        //Body
        list = ticket.textBody;
        list.forEach((element) {
          bluetooth.printCustom(element, 0, 0);
        });

        //Fotos
        list = ticket.textFooter;
        list.forEach((element) {
          List<String> sublist = [];
          sublist = ticket.format47Char(element);
          sublist.forEach((e) {
            bluetooth.printCustom(e, 0, 1);
          });
        });
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.paperCut();

        setState(() {
          infoModel.tickets++;
          //?Cambiando tema
          for (int i = 0; i < theme.bodyTheme.length; i++) {
            //theme.bodyTheme[i] = cardBodyThemeLock;
            theme.bodyTheme[i] = cardBodyThemeLock;
          }
        });
        impresionOK = true;
      } else {
        impresionOK = false;
        scaffoldState.currentState.showSnackBar(
            new SnackBar(content: Text('Impresora sin conexion')));
      }

      formularioBloqueado = true;
    });
    return impresionOK;
  }

  Future<bool> _showMaterialDialog(Map data) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () {},
        child: AlertDialog(
          title: Text("Subiendo Reporte"),
          content: Text("Subiendo reporte"),
          actions: <Widget>[
            FutureBuilder<ResponseReporte>(
              future: uploadReporte(data),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  formularioBloqueado = true;
                  reporteEnviado = true;
                  infoModel.info = 'Reporte enviado';
                  return ReporteOK(
                    folio: snapshot.data.msg,
                  );
                } else if (snapshot.hasError) {
                  formularioBloqueado = true;
                  reporteEnviado = false;
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

    setState(() {
      infoModel.info = 'Reporte Enviado';
      //?Cambiando tema
      for (int i = 0; i < theme.bodyTheme.length; i++) {
        theme.bodyTheme[i] = cardBodyThemeLock;
      }
    });
    return reporteEnviado;
  }
}

class ReporteOK extends StatefulWidget {
  final String folio;

  ReporteOK({this.folio});

  @override
  _ReporteOKState createState() => _ReporteOKState();
}

class _ReporteOKState extends State<ReporteOK> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            this.widget.folio,
            style: TextStyle(color: Colors.green, fontSize: 16.0),
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
              infoModel.info = 'Error al enviar reporte';
              Navigator.of(context).pop();
            },
            child: Text('Salir'),
          ),
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
