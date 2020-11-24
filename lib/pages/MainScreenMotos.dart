//Main Screen para seccion de motos

import 'dart:io';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrd_interfaz/models/DataModel.dart';
import 'package:mrd_interfaz/models/Temas.dart';
import 'package:mrd_interfaz/pages/Ticket.dart';
import 'package:mrd_interfaz/utils/utils.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/CardHeader.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/CuerpoReporte.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/HeaderText.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/Info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mrd_interfaz/servicios/Servicios.dart';

//? Funcion para subir el reporte
Future<ResponseReporte> uploadReporte(Map data) async {
  //Checamos el mapa de validacion
  var datos, fotos;

  //subiendo datos
  if (!validacionReporte['Datos']) {
    datos = await sendDataMoto(data);
  }

  //si los datos se subieron correctamente, enviamos las fotos
  if (!validacionReporte['Fotos']) {
    fotos =
        await sendImagesMoto(rutas: mapFotosCheckList, data: mapClienteMoto);
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

class MainScreenMotos extends StatefulWidget {
  @override
  _MainScreenMotosState createState() => _MainScreenMotosState();
}

GlobalKey<ScaffoldState> scaffoldState2 = GlobalKey();

class _MainScreenMotosState extends State<MainScreenMotos> {
  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: Text('Desea Salir De La Aplicacion?'),
            content: Text('Terminar app'),
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
        key: scaffoldState2,
        appBar: AppBar(
          title: Text('Captura De Reporte Motos'),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.green[400],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MainBodyMotos(),
        ),
      ),
    );
  }
}

class MainBodyMotos extends StatefulWidget {
  @override
  _MainBodyMotosState createState() => _MainBodyMotosState();
}

class _MainBodyMotosState extends State<MainBodyMotos> {
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
                  //? Upload
                  uploadReporte: () {
                    print('Upload report');
                    if (checkValidacion()) {
                      Map mapReporte = new Map();
                      mapReporte.addAll(mapClienteMoto);
                      mapReporte.addAll(mapCheckListMoto);
                      printMap(map: mapReporte);
                      if (!reporteEnviado) {
                        _showMaterialDialog(mapReporte);
                        //print(mapExterior);
                      } else {
                        scaffoldState2.currentState.showSnackBar(new SnackBar(
                          content: Text('El reporte ha sido enviado '),
                        ));
                      }
                    } else {
                      scaffoldState2.currentState.showSnackBar(new SnackBar(
                          content: Text('Debe capturar todos los campos')));
                    }
                  },

                  openReporte: () {},
                  //? BT Config
                  btConfig: () {
                    Navigator.of(context).pushNamed('/btconfig');
                  },
                  //? Imprimir Ticket
                  printTicket: () {
                    if (checkValidacion()) {
                      _printTicket();
                    } else {
                      scaffoldState2.currentState.showSnackBar(new SnackBar(
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
                      scaffoldState2.currentState.showSnackBar(new SnackBar(
                          content: Text(
                              'Reporte enviado o impreso, no se puede editar')));
                      return;
                    }
                    Navigator.of(context)
                        .pushNamed('/clienteMoto')
                        .then((value) {
                      setState(() {
                        if (value == false || value == null) {
                          theme.bodyTheme[0] = cardBodyThemeFail;
                          mapValidacionMoto['Cliente'] = false;
                        } else {
                          theme.bodyTheme[0] = cardBodyThemeOk;
                          mapValidacionMoto['Cliente'] = true;
                        }
                      });
                    });
                  },
                ),
                //Captura de Informacion del exterior del auto
                CardBody(
                  titulo: 'CheckList',
                  subtitulo: 'Check list de\n de la moto',
                  tooltip: 'Datos del exterior sin capturar',
                  icono: Icons.motorcycle,
                  iconoFondo: Colors.greenAccent,
                  iconoColor: Colors.white,
                  theme: theme.bodyTheme[1],
                  accion: () {
                    if (formularioBloqueado) {
                      scaffoldState2.currentState.showSnackBar(new SnackBar(
                          content: Text(
                              'Reporte enviado o impreso, no se puede editar')));
                      return;
                    }
                    Navigator.of(context)
                        .pushNamed('/checkListMoto')
                        .then((value) {
                      setState(() {
                        if (value == false || value == null) {
                          theme.bodyTheme[1] = cardBodyThemeFail;
                          mapValidacionMoto['Checklist'] = false;
                        } else {
                          theme.bodyTheme[1] = cardBodyThemeOk;
                          mapValidacionMoto['Checklist'] = true;
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
                      scaffoldState2.currentState.showSnackBar(new SnackBar(
                          content: Text(
                              'Reporte enviado o impreso, no se puede editar')));
                      return;
                    }
                    Navigator.of(context).pushNamed('/fotosMoto').then((value) {
                      setState(() {
                        if (value == false || value == null) {
                          theme.bodyTheme[4] = cardBodyThemeFail;
                          mapValidacionMoto['Fotos'] = false;
                        } else {
                          theme.bodyTheme[4] = cardBodyThemeOk;
                          mapValidacionMoto['Fotos'] = true;
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
        TicketMoto ticket = new TicketMoto();
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
            bluetooth.printCustom(e, 0, 1, charset: 'ISO-8859-1');
          });
        });
        //Body
        list = ticket.textBody;
        list.forEach((element) {
          bluetooth.printCustom(element, 0, 0, charset: 'ISO-8859-1');
        });

        //Fotos
        list = ticket.textFooter;
        list.forEach((element) {
          List<String> sublist = [];
          sublist = ticket.format47Char(element);
          sublist.forEach((e) {
            bluetooth.printCustom(e, 0, 1, charset: 'ISO-8859-1');
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
        scaffoldState2.currentState.showSnackBar(
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

  mapValidacionMoto.forEach((key, value) {
    if (value == false) {
      validacion = false;
    }
  });
  return validacion;
}
