// Screen de seleccion  de opciones de inventario
// Opciones => Bien, Mal, No trae.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccion'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(child: SelectionBody()),
    );
  }
}

//Valores de los radio buttons
enum SingingCharacter { bien, mal, na }

//Widget radio buttons
class SelectionBody extends StatefulWidget {
  @override
  _SelectionBodyState createState() => _SelectionBodyState();
}

class _SelectionBodyState extends State<SelectionBody> {
  SingingCharacter _character = SingingCharacter.bien;
  //Estilo de los textos del los radio buttons
  var style = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  String titulo;

  @override
  void didChangeDependencies() {
    titulo = ModalRoute.of(context).settings.arguments;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Titulo
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.grey[300],
            elevation: 10.0,
            child: Container(
              height: 80,
              alignment: Alignment.center,
              child: Text(
                titulo,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.greenAccent[200],
            child: InkWell(
              onTap: () {
                HapticFeedback.vibrate();
                setState(() {
                  var value = SingingCharacter.bien;
                  _character = value;
                });
              },
              child: ListTile(
                title: Text('Bien', style: style),
                leading: Radio(
                  value: SingingCharacter.bien,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              HapticFeedback.vibrate();
              setState(() {
                var value = SingingCharacter.mal;
                _character = value;
              });
            },
            child: Card(
              color: Colors.orange[200],
              child: ListTile(
                title: Text('Mal', style: style),
                leading: Radio(
                  value: SingingCharacter.mal,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              HapticFeedback.vibrate();
              setState(() {
                var value = SingingCharacter.na;
                _character = value;
              });
            },
            child: Card(
              color: Colors.red[200],
              child: ListTile(
                title: Text('No Trae', style: style),
                leading: Radio(
                  value: SingingCharacter.na,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: Colors.cyan,
              onPressed: () {
                HapticFeedback.vibrate();
                Navigator.of(context)
                    .pop(procesarRespuestaRadioButton(_character.toString()));
              },
              child: Icon(Icons.check, size: 36),
            ),
          ),
        ),
      ],
    );
  }

  String procesarRespuestaRadioButton(String v) {
    switch (v) {
      case 'SingingCharacter.bien':
        return 'Bien';
        break;

      case 'SingingCharacter.mal':
        return 'Mal';
        break;

      case 'SingingCharacter.na':
        return 'No Trae';
        break;

      default:
        return 'Bien';
    }
  }
}
