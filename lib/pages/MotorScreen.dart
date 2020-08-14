import 'package:flutter/material.dart';
import 'package:mrd_interfaz/models/Temas.dart';
import 'package:mrd_interfaz/widget/utils/HeaderLogo.dart';
import 'package:mrd_interfaz/widget/ClienteScreenWidget/ClientData.dart';
import 'package:mrd_interfaz/widget/utils/SaveButton.dart';

//Rura de la pagina de seleccion
const String ruta = '/seleccion';
//Funcion para pasar argumentos  al widget
List<String> pasarRuta({var datos}) {
  return datos;
}

class MotorScreen extends StatefulWidget {
  @override
  _MotorScreenState createState() => _MotorScreenState();
}

class _MotorScreenState extends State<MotorScreen> {
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
          title: Text('Motor'),
          backgroundColor: Colors.blue,
        ),
        body: MotorBody(),
      ),
    );
  }
}

class MotorBody extends StatefulWidget {
  @override
  _MotorBodyState createState() => _MotorBodyState();
}

class _MotorBodyState extends State<MotorBody> {
  CardCustomTheme theme = themeFail;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Header(
          imageAsset: 'assets/motor.png',
          titulo: 'Motor',
          subtitulo: 'Capture la informacion solicitada',
        ),
        CardData(
          titulo: 'Radiador',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Radiador'])
          },
        ),
        CardData(
          titulo: 'Motoventilador',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Motoventilador'])
          },
        ),
        CardData(
          titulo: 'Alternador',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Alternador'])
          },
        ),
        CardData(
          titulo: 'Cable de bujias',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Cable de bujias'])
          },
        ),
        CardData(
          titulo: 'Depurador',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Depurador'])
          },
        ),
        CardData(
          titulo: 'Carburador',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Carburador'])
          },
        ),
        CardData(
          titulo: 'Filtro de aire',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Filtro de aire'])
          },
        ),
        CardData(
          titulo: 'Inyectores',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Inyectores'])
          },
        ),
        CardData(
          titulo: 'Compresor',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Compresor'])
          },
        ),
        CardData(
          titulo: 'Computadora',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Computadora'])
          },
        ),
        CardData(
          titulo: 'Bateria',
          subtitulo: '',
          tooltip: 'Datos sin capturar',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Bateria'])
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: ClientForm(
            hint: 'Marca',
          ),
        ),
        SaveButton(color: Colors.blue),
      ],
    );
  }
}

//Widget 1 input field
class ClientForm extends StatefulWidget {
  final TextInputType tecladoType;
  final String hint;
  ClientForm({@required this.hint, this.tecladoType});
  @override
  _ClientFormState createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  String inputText = '';
  final TextEditingController _controller = TextEditingController();
  void onSubmitted(String value) {
    setState(() {
      print(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 26,
        child: TextField(
          keyboardType: this.widget.tecladoType,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: this.widget.hint,
            hintText: this.widget.hint,
            hintStyle: TextStyle(color: Colors.blue),
          ),
          controller: _controller,
          onSubmitted: (String value) {
            onSubmitted(value);
          },
        ),
      ),
    );
  }
}
