import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrd_interfaz/widget/utils/HeaderLogo.dart';
import 'package:mrd_interfaz/widget/utils/SaveButton.dart';

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Interior'),
          backgroundColor: Colors.purple,
        ),
        body: ReporteFBody(),
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
              childAspectRatio: 4 / 4,
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
                ),
                CardBody(
                  titulo: 'Foto Trasera',
                  subtitulo: 'Foto trasera del vehiculo',
                  icono: Icons.photo_camera,
                  iconoFondo: Colors.grey[400],
                  iconoColor: Colors.purple,
                  cardColor: Colors.grey[200],
                  accion: () {},
                ),
                CardBody(
                  titulo: 'Foto De Costado',
                  subtitulo: 'Foto de costado del vehiculo',
                  icono: Icons.photo_camera,
                  iconoFondo: Colors.grey[400],
                  iconoColor: Colors.purple,
                  cardColor: Colors.grey[200],
                  accion: () {},
                ),
                CardBody(
                  titulo: 'Foto De Costado',
                  subtitulo: 'Segunda foto de costado del vehiculo',
                  icono: Icons.photo_camera,
                  iconoFondo: Colors.grey[400],
                  iconoColor: Colors.purple,
                  cardColor: Colors.grey[200],
                  accion: () {},
                ),
                CardBody(
                  titulo: 'Placas',
                  subtitulo: 'Foto de las placas del vehiculo',
                  icono: Icons.photo_camera,
                  iconoFondo: Colors.grey[400],
                  iconoColor: Colors.purple,
                  cardColor: Colors.grey[200],
                  accion: () {},
                ),
                CardBody(
                  titulo: 'Foto De Auto Sobre Grua',
                  subtitulo: 'Foto del vehiculo sobre la grua',
                  icono: Icons.photo_camera,
                  iconoFondo: Colors.grey[400],
                  iconoColor: Colors.purple,
                  cardColor: Colors.grey[200],
                  accion: () {},
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SaveButton(
                  color: Colors.purple,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardBody extends StatefulWidget {
  final String titulo;
  final String subtitulo;
  final IconData icono;
  final Color iconoFondo;
  final Color iconoColor;
  final Color cardColor;
  final Function accion;

  const CardBody({
    Key key,
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10.0,
        color: this.widget.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            this.widget.accion();
            HapticFeedback.vibrate();
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
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
                CircleAvatar(
                  radius: 36,
                  backgroundColor: this.widget.iconoFondo,
                  child: Icon(
                    this.widget.icono,
                    color: this.widget.iconoColor,
                    size: 40,
                  ),
                ),
                Text(
                  this.widget.subtitulo,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.purple[200],
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
