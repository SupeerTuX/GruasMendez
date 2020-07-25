import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardData extends StatefulWidget {
  String titulo;
  String subtitulo;
  String tooltip;
  IconData okOrFailIcon;
  Color iconoColor;
  Color fondoColor;
  Function accion;

  CardData({
    @required this.titulo,
    @required this.subtitulo,
    @required this.tooltip,
    @required this.okOrFailIcon,
    @required this.iconoColor,
    @required this.fondoColor,
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
        color: this.widget.fondoColor,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            HapticFeedback.vibrate();
            var data = this.widget.accion();
            String dataString = data.toString();
            dataString = dataString.substring(2, dataString.length - 2);
            var lista = dataString.split(',');
            print(lista[0]);
            print(lista[1]);
            Navigator.of(context)
                .pushNamed(lista[0], arguments: lista[1])
                .then((value) {
              if (value != null) {
                print('Opcion elegida = $value');
                setState(() {
                  this.widget.okOrFailIcon = Icons.check;
                  this.widget.iconoColor = Colors.green;
                  this.widget.fondoColor = Colors.greenAccent[100];
                  this.widget.subtitulo =
                      'Opcion ingresasada: ' + value.toString();
                });
              }
            });
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
                        this.widget.titulo,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          this.widget.okOrFailIcon,
                          color: this.widget.iconoColor,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    this.widget.subtitulo,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.left,
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
