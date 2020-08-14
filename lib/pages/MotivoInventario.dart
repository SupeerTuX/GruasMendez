//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum SingingCharacter {
  asistencia,
  siniestro,
  alcoholimetro,
  mal_estacionado,
  detencion,
  solo_inventario,
  operativo_especial
}

SingingCharacter _character = SingingCharacter.alcoholimetro;

String seleccion = 'Alcoholimetro';

class InventarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario'),
        backgroundColor: Colors.orange,
      ),
      body: InventarioBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HapticFeedback.vibrate();
          Navigator.of(context).pop(seleccion);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class InventarioBody extends StatefulWidget {
  @override
  _InventarioBodyState createState() => _InventarioBodyState();
}

class _InventarioBodyState extends State<InventarioBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 15.0,
            color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Motivo De inventario',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        ListTile(
          title: Text('Alcoholimetro'),
          leading: Radio(
            value: SingingCharacter.alcoholimetro,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                seleccion = 'Alcoholimetro';
              });
            },
          ),
        ),
        ListTile(
          title: Text('Asistencia'),
          leading: Radio(
            value: SingingCharacter.asistencia,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                seleccion = 'Asistencia';
              });
            },
          ),
        ),
        ListTile(
          title: Text('Detencion'),
          leading: Radio(
            value: SingingCharacter.detencion,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                seleccion = 'Detencion';
              });
            },
          ),
        ),
        ListTile(
          title: Text('Mal Estacionado'),
          leading: Radio(
            value: SingingCharacter.mal_estacionado,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                seleccion = 'Mal Estacionado';
              });
            },
          ),
        ),
        ListTile(
          title: Text('Operativo Especial'),
          leading: Radio(
            value: SingingCharacter.operativo_especial,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                seleccion = 'Operativo Especial';
              });
            },
          ),
        ),
        ListTile(
          title: Text('Siniestro'),
          leading: Radio(
            value: SingingCharacter.siniestro,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                seleccion = 'Siniestro';
              });
            },
          ),
        ),
        ListTile(
          title: Text('Solo Inventario'),
          leading: Radio(
            value: SingingCharacter.solo_inventario,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
                seleccion = 'Solo Inventario';
              });
            },
          ),
        ),
      ],
    );
  }
}
