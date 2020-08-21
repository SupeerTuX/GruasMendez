///#################################################
///Cuerpo del la app, contiene los widgets para la
///captura del reporte, que son datos del cliente,
///Exterior, Interior, Motor y reporte fotografico

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrd_interfaz/models/Temas.dart';

class CardBody extends StatefulWidget {
  final String titulo;
  final String subtitulo;
  final String tooltip;
  final CardBodyTheme theme;
  final IconData icono;
  final Color iconoColor;
  final Color iconoFondo;
  final Function accion;

  const CardBody({
    Key key,
    @required this.titulo,
    @required this.subtitulo,
    @required this.tooltip,
    @required this.theme,
    @required this.icono,
    @required this.iconoColor,
    @required this.iconoFondo,
    @required this.accion,
  }) : super(key: key);

  @override
  _CardBodyState createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      color: widget.theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          this.widget.accion();
          HapticFeedback.vibrate();
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: this.widget.iconoFondo,
                radius: 22,
                child: Icon(
                  widget.icono,
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    this.widget.titulo,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    this.widget.subtitulo,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Tooltip(
                  message: this.widget.tooltip,
                  child: Icon(
                    widget.theme.icono,
                    color: widget.theme.iconoColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
