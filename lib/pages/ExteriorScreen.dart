import 'package:flutter/material.dart';
import 'package:mrd_interfaz/models/DataModel.dart';
import 'package:mrd_interfaz/models/Temas.dart';
import 'package:mrd_interfaz/models/Contenido.dart';
import 'package:mrd_interfaz/widget/utils/HeaderLogo.dart';
import 'package:mrd_interfaz/widget/ClienteScreenWidget/ClientData.dart';

const String routeName = '/seleccion';

class ExteriorScreen extends StatefulWidget {
  @override
  _ExteriorScreenState createState() => _ExteriorScreenState();
}

class _ExteriorScreenState extends State<ExteriorScreen> {
  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Desea Salir De La Captura?'),
            content: new Text(
                'No se ha terminado la captura. Si sale se perdera la infomacion'),
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

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exterior'),
          backgroundColor: Colors.tealAccent[400],
        ),
        body: ExteriorBody(),
        key: scaffoldState,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //print(mapExterior);
            bool validacion = true;
            mapExterior.forEach((key, value) {
              if (value == '') {
                print('Valor $key: $value');
                print('Validacion = $validacion');
                validacion = false;
              }
            });

            if (validacion) {
              scaffoldState.currentState.showSnackBar(
                  new SnackBar(content: Text('Datos guardados correctamente')));
              Navigator.of(context).pop(validacion);
            } else {
              scaffoldState.currentState.showSnackBar(new SnackBar(
                  content: Text('No se han capturado todos los datos')));
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.tealAccent[400],
        ),
      ),
    );
  }
}

class ExteriorBody extends StatefulWidget {
  @override
  _ExteriorBodyState createState() => _ExteriorBodyState();
}

//Rura de la pagina de seleccion
const String ruta = '/seleccion';
//Funcion para pasar argumentos  al widget
List<String> pasarRuta({var datos}) {
  return datos;
}

CardCustomTheme theme = themeFail;

class _ExteriorBodyState extends State<ExteriorBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Header(
          imageAsset: 'assets/grua.png',
          titulo: 'Exterior Del Vehiculo',
          subtitulo: 'Capture la informacion solicitada',
        ),
        CardData(
            contenido: defensaDelantera,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: defensaDelantera.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    defensaDelantera.theme = themeOk;
                    defensaDelantera.subtitulo = value;
                    mapExterior['DefensaDelantera'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: carroceriaSinGolpes,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: carroceriaSinGolpes.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    carroceriaSinGolpes.theme = themeOk;
                    carroceriaSinGolpes.subtitulo = value;
                    mapExterior['CarroceriaSinGolpes'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: parrilla,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: parrilla.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    parrilla.theme = themeOk;
                    parrilla.subtitulo = value;
                    mapExterior['Parrilla'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: faros,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: faros.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    faros.theme = themeOk;
                    faros.subtitulo = value;
                    mapExterior['Faros'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: cofre,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: cofre.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    cofre.theme = themeOk;
                    cofre.subtitulo = value;
                    mapExterior['Cofre'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: parabrisas,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: parabrisas.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    parabrisas.theme = themeOk;
                    parabrisas.subtitulo = value;
                    mapExterior['Parabrisas'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: limpiadores,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: limpiadores.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    limpiadores.theme = themeOk;
                    limpiadores.subtitulo = value;
                    mapExterior['Limpiadores'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: emblemas,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: emblemas.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    emblemas.theme = themeOk;
                    emblemas.subtitulo = value;
                    mapExterior['Emblemas'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: portezuelaIzquierda,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: portezuelaIzquierda.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    portezuelaIzquierda.theme = themeOk;
                    portezuelaIzquierda.subtitulo = value;
                    mapExterior['PortezuelaIzq'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: cristalLatIzquierda,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: cristalLatIzquierda.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    cristalLatIzquierda.theme = themeOk;
                    cristalLatIzquierda.subtitulo = value;
                    mapExterior['CristalLatIzq'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: medallon,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: medallon.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    medallon.theme = themeOk;
                    medallon.subtitulo = value;
                    mapExterior['Medallon'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: cajuela,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: cajuela.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    cajuela.theme = themeOk;
                    cajuela.subtitulo = value;
                    mapExterior['Cajuela'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: defensaTrasera,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: defensaTrasera.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    defensaTrasera.theme = themeOk;
                    defensaTrasera.subtitulo = value;
                    mapExterior['DefensaTrasera'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: portezuelaDerecha,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: portezuelaDerecha.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    portezuelaDerecha.theme = themeOk;
                    portezuelaDerecha.subtitulo = value;
                    mapExterior['PortezuelaDer'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: cristalLatDerecho,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: cristalLatDerecho.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    cristalLatDerecho.theme = themeOk;
                    cristalLatDerecho.subtitulo = value;
                    mapExterior['CristalLatDer'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: antenas,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: antenas.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    antenas.theme = themeOk;
                    antenas.subtitulo = value;
                    mapExterior['Antenas'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: espejos,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: espejos.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    espejos.theme = themeOk;
                    espejos.subtitulo = value;
                    mapExterior['Espejos'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: taponesRuedas,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: taponesRuedas.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    taponesRuedas.theme = themeOk;
                    taponesRuedas.subtitulo = value;
                    mapExterior['TaponesRuedas'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: taponGasolina,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: taponGasolina.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    taponGasolina.theme = themeOk;
                    taponGasolina.subtitulo = value;
                    mapExterior['TaponGasolina'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: salpicaderaDerecha,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: salpicaderaDerecha.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    salpicaderaDerecha.theme = themeOk;
                    salpicaderaDerecha.subtitulo = value;
                    mapExterior['SalpicaderaDer'] = value;
                  });
                }
              });
            }),
        CardData(
            contenido: salpicaderaIzquierda,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: salpicaderaIzquierda.titulo)
                  .then((value) {
                if (value != null) {
                  setState(() {
                    salpicaderaIzquierda.theme = themeOk;
                    salpicaderaIzquierda.subtitulo = value;
                    mapExterior['SalpicaderaIzq'] = value;
                  });
                }
              });
            }),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
