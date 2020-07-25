import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrd_interfaz/widget/ClienteScreenWidget/ClientData.dart';
import 'package:mrd_interfaz/widget/utils/HeaderLogo.dart';

class ClienteScreen extends StatefulWidget {
  @override
  _ClienteScreenState createState() => _ClienteScreenState();
}

class _ClienteScreenState extends State<ClienteScreen> {
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
          title: Text('Datos Del Cliente'),
          backgroundColor: Colors.orange,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Header(
                  imageAsset: 'assets/checklist.png',
                  titulo: 'Captura De Informacion',
                  subtitulo: 'Capture los datos del cliente solicitados.',
                ),
                NumeroReporte(),
                //Captura de fecha y hora
                CardData(
                  titulo: 'Fecha y Hora',
                  subtitulo: 'Ingrese la fecha y hora del reporte',
                  tooltip: 'No se ha ingresado la fecha y hora',
                  okOrFailIcon: Icons.error,
                  iconoColor: Colors.red,
                  fondoColor: Colors.grey[100],
                  accion: () {
                    print('Captura de hora y fecha');
                  },
                ),
                //Captura de direccion por gps
                CardData(
                  titulo: 'Direccion',
                  subtitulo: 'Capture la direccion del arrastre',
                  tooltip: 'tooltip',
                  okOrFailIcon: Icons.error,
                  iconoColor: Colors.red,
                  fondoColor: Colors.grey[100],
                  accion: () {
                    print('Captura de direccion por gps');
                  },
                ),
                //Captura de motivo de inventario
                CardData(
                  titulo: 'Motivo de inventario',
                  subtitulo: 'Capture el motivo del inventario',
                  tooltip: 'tooltip',
                  okOrFailIcon: Icons.error,
                  iconoColor: Colors.red,
                  fondoColor: Colors.grey[100],
                  accion: () {
                    print('Motivo de inventario');
                  },
                ),
                //Marca Vehiculo
                RowInputLine(
                  textForm1: 'Marca Del Vehiculo',
                  textForm1Action: () {},
                  textForm2: 'Tipo',
                  textForm2Action: () {},
                ),
                RowInputLine(
                  textForm1: 'Modelo',
                  textForm1Action: () {},
                  textForm2: 'Color',
                  textForm2Action: () {},
                ),
                RowInputLine(
                  textForm1: 'Placas',
                  textForm1Action: () {},
                  textForm2: 'No. Serie',
                  textForm2Action: () {},
                ),
                RowInputSwitch(
                  textForm: 'Conductor O Propietario',
                  accion: () {},
                ),
                RowInputLine(
                  textForm1: 'Telefono',
                  textForm1Action: () {},
                  textForm2: 'Grua',
                  textForm2Action: () {},
                ),
                RowInputLine(
                  textForm1: 'Operador',
                  textForm1Action: () {},
                  textForm2: 'Solicitante',
                  textForm2Action: () {},
                ),
                ValidacionCliente(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Widget boton para guardar o validar
class ValidacionCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0.0),
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.orange, width: 2.0),
        child: Text(
          'Guardar Informacion',
          style: TextStyle(fontSize: 18, color: Colors.orange),
        ),
        onPressed: () {
          HapticFeedback.vibrate();
        },
      ),
    );
  }
}

//Widget Row con un input text y un switch
class RowInputSwitch extends StatefulWidget {
  final String textForm;
  final Function accion;

  RowInputSwitch({
    this.textForm,
    this.accion,
  });
  @override
  _RowInputSwitchState createState() => _RowInputSwitchState();
}

class _RowInputSwitchState extends State<RowInputSwitch> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ClientForm(
          hint: this.widget.textForm,
          action: this.widget.accion,
        ),
        Icon(Icons.vpn_key, color: Colors.orangeAccent),
        SizedBox(
          width: 10,
        ),
        Text(
          'Llaves:',
          style: TextStyle(color: Colors.orange),
        ),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              print('Switch: $isSwitched');
            });
          },
        )
      ],
    );
  }
}

//Widget row con 2 campos Textfield
class RowInputLine extends StatelessWidget {
  final String textForm1;
  final String textForm2;
  final Function textForm1Action;
  final Function textForm2Action;
  const RowInputLine({
    @required this.textForm1,
    @required this.textForm1Action,
    @required this.textForm2,
    @required this.textForm2Action,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ClientForm(
          hint: this.textForm1,
          action: this.textForm1Action,
        ),
        ClientForm(
          hint: this.textForm2,
          action: this.textForm2Action,
        ),
      ],
    );
  }
}

//Widget 1 input field
class ClientForm extends StatefulWidget {
  final String hint;
  final Function action;

  ClientForm({this.hint, this.action});
  @override
  _ClientFormState createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  String inputText = '';
  final TextEditingController _controller = TextEditingController();
  void onSubmitted(String value) {
    setState(() {
      print(_controller.text);
      this.widget.action();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 26,
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: this.widget.hint,
            hintText: this.widget.hint,
            hintStyle: TextStyle(color: Colors.orange),
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

//Widget numero de reporte
class NumeroReporte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'REPORTE #: ',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.redAccent),
      ),
    );
  }
}
