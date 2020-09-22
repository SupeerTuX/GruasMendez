import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrd_interfaz/models/DataModel.dart';

import 'package:mrd_interfaz/models/Contenido.dart';
import 'package:mrd_interfaz/models/Temas.dart';

//Valores de los radio buttons
//enum SingingCharacter { bien, mal, na }

class CardData extends StatefulWidget {
  final CardCustomContent contenido;

  CardData({
    @required this.contenido,
  });

  @override
  _CardDataState createState() => _CardDataState();
}

class _CardDataState extends State<CardData> {
  SingingCharacter _character;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _character = widget.contenido.opcion;
  }

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
        child: Container(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      widget.contenido.titulo,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //color: Colors.greenAccent[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: SingingCharacter.bien,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              HapticFeedback.vibrate();
                              setState(() {
                                _character = value;
                                mapExterior[widget.key] = 'Bien';
                                widget.contenido.opcion = value;
                                widget.contenido.theme = themeOk;
                                //_colorCard = Colors.greenAccent[100];
                              });
                            },
                          ),
                          Text('Bien'),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: SingingCharacter.mal,
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            HapticFeedback.vibrate();
                            setState(() {
                              _character = value;
                              mapExterior[widget.key] = 'Mal';
                              widget.contenido.opcion = value;
                              widget.contenido.theme = themeWarning;
                              //_colorCard = Colors.orange[100];
                            });
                          },
                        ),
                        Text('Mal'),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: SingingCharacter.na,
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            HapticFeedback.vibrate();
                            setState(() {
                              _character = value;
                              mapExterior[widget.key] = 'No Trae';
                              widget.contenido.opcion = value;
                              widget.contenido.theme = themeFail;
                              //_colorCard = Colors.red[100];
                            });
                          },
                        ),
                        Text('No Trae'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardDataCliente extends StatefulWidget {
  final CardCustomContent contenido;
  final Function accion;

  CardDataCliente({
    @required this.contenido,
    @required this.accion,
  });

  @override
  _CardDataClienteState createState() => _CardDataClienteState();
}

class _CardDataClienteState extends State<CardDataCliente> {
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
