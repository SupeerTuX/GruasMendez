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
        CardData(contenido: defensaDelantera),
        CardData(contenido: carroceriaSinGolpes),
        CardData(contenido: parrilla),
        CardData(contenido: faros),
        CardData(contenido: cofre),
        CardData(contenido: parabrisas),
        CardData(contenido: limpiadores),
        CardData(contenido: emblemas),
        CardData(contenido: portezuelaIzquierda),
        CardData(contenido: cristalLatIzquierda),
        CardData(contenido: medallon),
        CardData(contenido: cajuela),
        CardData(contenido: defensaTrasera),
        CardData(contenido: portezuelaDerecha),
        CardData(contenido: cristalLatDerecho),
        CardData(contenido: antenas),
        CardData(contenido: espejos),
        CardData(contenido: taponesRuedas),
        CardData(contenido: taponGasolina),
        CardData(contenido: salpicaderaDerecha),
        CardData(contenido: salpicaderaIzquierda),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
