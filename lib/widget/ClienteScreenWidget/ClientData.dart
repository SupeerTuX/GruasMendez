import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrd_interfaz/models/DataModel.dart';

import 'package:mrd_interfaz/models/Contenido.dart';

class CardData extends StatefulWidget {
  final CardCustomContent contenido;
  final Function accion;

  CardData({
    @required this.contenido,
    @required this.accion,
  });

  @override
  _CardDataState createState() => _CardDataState();
}

class _CardDataState extends State<CardData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
        color: widget.contenido.theme.cardBackground,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            HapticFeedback.vibrate();
            this.widget.accion();
          },
          child: Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.contenido.titulo,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          widget.contenido.theme.icon,
                          color: widget.contenido.theme.iconColor,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.contenido.subtitulo,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Llaves extends StatefulWidget {
  @override
  _LlavesState createState() => _LlavesState();
}

class _LlavesState extends State<Llaves> {
  bool isSwitched = false;
  String label = 'No';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Llaves: '),
        Text(label),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              HapticFeedback.vibrate();
              value ? label = 'Si' : label = 'No';
              mapCliente['Llaves'] = label;
            });
          },
        )
      ],
    );
  }
}
