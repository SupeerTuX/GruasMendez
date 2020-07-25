import 'package:flutter/material.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/CardHeader.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/CuerpoReporte.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/HeaderText.dart';
import 'package:mrd_interfaz/widget/MainScreenWidgets/Info.dart';

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

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                HeaderText(),
                CardHeader(),
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
                  cardColor: Colors.white,
                  accion: () {
                    print('Card Cliente');
                    Navigator.of(context).pushNamed('/cliente');
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
                  cardColor: Colors.white,
                  accion: () {
                    print('Card Exterior');
                    Navigator.of(context).pushNamed('/exterior');
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
                  cardColor: Colors.white,
                  accion: () {
                    print('Card Interior');
                    Navigator.of(context).pushNamed('/interior');
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
                  cardColor: Colors.white,
                  accion: () {
                    print('Card Motor');
                    Navigator.of(context).pushNamed('/motor');
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
                  cardColor: Colors.white,
                  accion: () {
                    print('Captura de fotod');
                    Navigator.of(context).pushNamed('/fotos');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
