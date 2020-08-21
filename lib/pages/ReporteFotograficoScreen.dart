import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrd_interfaz/models/DataModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mrd_interfaz/widget/utils/HeaderLogo.dart';

class ReporteFotograficoScreen extends StatefulWidget {
  @override
  _ReporteFotograficoScreenState createState() =>
      _ReporteFotograficoScreenState();
}

class _ReporteFotograficoScreenState extends State<ReporteFotograficoScreen> {
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
          title: Text('Fotos'),
          backgroundColor: Colors.purple,
        ),
        body: ReporteFBody(),
        key: scaffoldState,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //print(mapReporteFotografico);
            HapticFeedback.vibrate();
            bool validacion = true;
            mapReporteFotografico.forEach((key, value) {
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

class ReporteFBody extends StatefulWidget {
  @override
  _ReporteFBodyState createState() => _ReporteFBodyState();
}

class _ReporteFBodyState extends State<ReporteFBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Header(
                  imageAsset: 'assets/camara.png',
                  titulo: 'ReporteFotografico',
                  subtitulo: 'Tome las fotos que se le indican',
                ),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 5,
            ),
            delegate: SliverChildListDelegate(
              [
                CardBody(
                  titulo: 'Foto Frontal',
                  subtitulo: 'Foto frontal del vehiculo',
                  icono: Icons.photo_camera,
                  iconoFondo: Colors.grey[400],
                  iconoColor: Colors.purple,
                  cardColor: Colors.grey[200],
                  accion: () {},
                  mapKey: 'img1',
                ),
                CardBody(
                  titulo: 'Foto Trasera',
                  subtitulo: 'Foto trasera del vehiculo',
                  icono: Icons.photo_camera,
                  iconoFondo: Colors.grey[400],
                  iconoColor: Colors.purple,
                  cardColor: Colors.grey[200],
                  accion: () {},
                  mapKey: 'img2',
                ),
                CardBody(
                  titulo: 'Foto De Costado',
                  subtitulo: 'Foto de costado del vehiculo',
                  icono: Icons.photo_camera,
                  iconoFondo: Colors.grey[400],
                  iconoColor: Colors.purple,
                  cardColor: Colors.grey[200],
                  accion: () {},
                  mapKey: 'img3',
                ),
                CardBody(
                  titulo: 'Foto De Costado',
                  subtitulo: 'Segunda foto de costado del vehiculo',
                  icono: Icons.photo_camera,
                  iconoFondo: Colors.grey[400],
                  iconoColor: Colors.purple,
                  cardColor: Colors.grey[200],
                  accion: () {},
                  mapKey: 'img4',
                ),
                CardBody(
                  titulo: 'Placas',
                  subtitulo: 'Foto de las placas del vehiculo',
                  icono: Icons.photo_camera,
                  iconoFondo: Colors.grey[400],
                  iconoColor: Colors.purple,
                  cardColor: Colors.grey[200],
                  accion: () {},
                  mapKey: 'img5',
                ),
                CardBody(
                  titulo: 'Foto De Auto Sobre Grua',
                  subtitulo: 'Foto del vehiculo sobre la grua',
                  icono: Icons.photo_camera,
                  iconoFondo: Colors.grey[400],
                  iconoColor: Colors.purple,
                  cardColor: Colors.grey[200],
                  accion: () {},
                  mapKey: 'img6',
                ),
                CardBody(
                  titulo: 'Foto Del Tablero',
                  subtitulo: 'Foto del tablero del vehiculo',
                  icono: Icons.photo_camera,
                  iconoFondo: Colors.grey[400],
                  iconoColor: Colors.purple,
                  cardColor: Colors.grey[200],
                  accion: () {},
                  mapKey: 'img7',
                ),
                CardBody(
                  titulo: 'Foto No Serie',
                  subtitulo: 'Foto del numero de serie',
                  icono: Icons.photo_camera,
                  iconoFondo: Colors.grey[400],
                  iconoColor: Colors.purple,
                  cardColor: Colors.grey[200],
                  accion: () {},
                  mapKey: 'img8',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardBody extends StatefulWidget {
  final String mapKey;
  final String titulo;
  final String subtitulo;
  final IconData icono;
  final Color iconoFondo;
  final Color iconoColor;
  final Color cardColor;
  final Function accion;

  const CardBody({
    Key key,
    @required this.mapKey,
    @required this.titulo,
    @required this.subtitulo,
    @required this.icono,
    @required this.iconoFondo,
    @required this.iconoColor,
    @required this.cardColor,
    @required this.accion,
  }) : super(key: key);

  @override
  _CardBodyState createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  //contenedor de la imagen
  final picker = ImagePicker();
  BoxDecoration _fondo = BoxDecoration(); //Imagen de fondo
  ImageProvider<dynamic> fondoImg;

  @override
  void initState() {
    super.initState();

    if (mapReporteFotografico[widget.mapKey] == '') {
      _fondo = new BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/foto.png'),
          fit: BoxFit.fill,
        ),
      );
    } else {
      _fondo = new BoxDecoration(
        image: DecorationImage(
          image: FileImage(File(mapReporteFotografico[widget.mapKey])),
          fit: BoxFit.fill,
        ),
      );
    }
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      print(pickedFile.path);
      setState(() {
        //_image = File(pickedFile.path);
        mapReporteFotografico[widget.mapKey] = pickedFile.path;
        _fondo = new BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(mapReporteFotografico[widget.mapKey])),
            fit: BoxFit.fill,
          ),
        );
      });
    } else {
      print('No se capturo la imagen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 10.0,
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                color: Colors.blueGrey[100],
                child: Text(
                  this.widget.titulo,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[300],
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    HapticFeedback.vibrate();
                    getImage();
                  },
                  onLongPress: () {
                    if (mapReporteFotografico[widget.mapKey] != null) {
                      Navigator.of(context).pushNamed('/fotoScreen',
                          arguments: {
                            'titulo': this.widget.titulo,
                            'ruta': mapReporteFotografico[widget.mapKey]
                          });
                    }
                  },
                  child: Container(
                    decoration: _fondo,
                  ),
                ),
              ),
              Text(
                this.widget.subtitulo,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.purple[300],
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
