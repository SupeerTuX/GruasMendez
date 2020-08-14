import 'package:flutter/material.dart';
import 'package:mrd_interfaz/models/Temas.dart';
import 'package:mrd_interfaz/widget/utils/HeaderLogo.dart';
import 'package:mrd_interfaz/widget/ClienteScreenWidget/ClientData.dart';
import 'package:mrd_interfaz/widget/utils/SaveButton.dart';

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
          titulo: 'Defensa Delantera',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Defensa Delantera'])
          },
        ),
        CardData(
          titulo: 'Carroceria Sin Golpes',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Carroceria Sin Golpes'])
          },
        ),
        CardData(
          titulo: 'Parrilla',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Parrilla'])
          },
        ),
        CardData(
          titulo: 'Faros',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Faros'])
          },
        ),
        CardData(
          titulo: 'Cofre',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Cofre'])
          },
        ),
        CardData(
          titulo: 'Parabrisas',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Parabrisas'])
          },
        ),
        CardData(
          titulo: 'Limpiadores',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Limpiadores'])
          },
        ),
        CardData(
          titulo: 'Emblemas',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Emblemas'])
          },
        ),
        CardData(
          titulo: 'Portezuela Izquierda',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Portezuela Izquierda'])
          },
        ),
        CardData(
          titulo: 'Cristales lat Izquierda',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Cristales lat Izquierda'])
          },
        ),
        CardData(
          titulo: 'Medallon',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Medallon'])
          },
        ),
        CardData(
          titulo: 'Cajuela',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Cajuela'])
          },
        ),
        CardData(
          titulo: 'Defensa Trasera',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Defensa Trasera'])
          },
        ),
        CardData(
          titulo: 'Portezuela Derecha',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Portezuela Derecha'])
          },
        ),
        CardData(
          titulo: 'Cristal lat Derecho',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Cristal lat Derecho'])
          },
        ),
        CardData(
          titulo: 'Antenas',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Antenas'])
          },
        ),
        CardData(
          titulo: 'Espejos',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Espejos'])
          },
        ),
        CardData(
          titulo: 'Tapones Ruedas',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Tapones Ruedas'])
          },
        ),
        CardData(
          titulo: 'Tapon De Gasolina',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Tapon De Gasolina'])
          },
        ),
        CardData(
          titulo: 'Salpicadera Derecha',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Salpicadera Derecha'])
          },
        ),
        CardData(
          titulo: 'Defensa Delantera',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Defensa Delantera'])
          },
        ),
        CardData(
          titulo: 'Salpicadera Izquierda',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Salpicadera Izquierda'])
          },
        ),
        SaveButton(color: Colors.tealAccent[400]),
      ],
    );
  }
}
