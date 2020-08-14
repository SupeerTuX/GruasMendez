import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrd_interfaz/models/Temas.dart';
import 'package:provider/provider.dart';
import 'package:mrd_interfaz/widget/utils/HeaderLogo.dart';
import 'package:mrd_interfaz/widget/utils/SaveButton.dart';
import 'package:mrd_interfaz/widget/ClienteScreenWidget/ClientData.dart';

//Manejo del estado del las CardList
class CardState with ChangeNotifier {
  String _titulo = '';
  String _subtitulo = '';
  String _tooltip;
  IconData _okOrFailIcon = Icons.error;
  Color _iconoColor = Colors.red;
  Color _fondoColor = Colors.grey[200];

  String get titulo => _titulo;
  String get subtitulo => _subtitulo;
  String get tooltip => _tooltip;
  IconData get okOrFailIcon => _okOrFailIcon;
  Color get iconoColor => _iconoColor;
  Color get fondoColor => _fondoColor;

  set titulo(String value) {
    _titulo = value;
    notifyListeners();
  }

  set subtitulo(String value) {
    _subtitulo = value;
    notifyListeners();
  }

  set tooltip(String value) {
    _tooltip = value;
    notifyListeners();
  }

  set okOrFailIcon(IconData value) {
    _okOrFailIcon = value;
    notifyListeners();
  }

  set iconoColor(Color value) {
    _iconoColor = value;
    notifyListeners();
  }

  set fondoColor(Color value) {
    _fondoColor = value;
    notifyListeners();
  }
}

//Ruta de seleccion
const String ruta = '/seleccion';

//Funcion para pasar datos
List<String> pasarRuta({var datos}) {
  return datos;
}

class InteriorScreen extends StatefulWidget {
  @override
  _InteriorScreenState createState() => _InteriorScreenState();
}

class _InteriorScreenState extends State<InteriorScreen> {
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
          backgroundColor: Colors.cyan,
        ),
        body: InteriorBody(),
      ),
    );
  }
}

class InteriorBody extends StatelessWidget {
  CardCustomTheme theme = themeFail;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Header(
          imageAsset: 'assets/coche.png',
          titulo: 'Interior Del Vehiculo',
          subtitulo: 'Capture la informacion solicitada',
        ),
        CardData(
          titulo: 'Tablero',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Tablero'])
          },
        ),
        CardData(
          titulo: 'Volante',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Volante'])
          },
        ),
        CardData(
          titulo: 'Radio',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Radio'])
          },
        ),
        CardData(
          titulo: 'Equipo de sonido',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Equipo de sonido'])
          },
        ),
        CardData(
          titulo: 'Encendedor',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Encendedor'])
          },
        ),
        CardData(
          titulo: 'Espejo',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Espejo'])
          },
        ),
        CardData(
          titulo: 'Asientos',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Asientos'])
          },
        ),
        CardData(
          titulo: 'Tapetes de alfombra',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Tapetes de alfombra'])
          },
        ),
        CardData(
          titulo: 'Tapete de hule',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Tapete de hule'])
          },
        ),
        CardData(
          titulo: 'Extintor',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Extintor'])
          },
        ),
        CardData(
          titulo: 'Gato y maneral',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Gato y maneral'])
          },
        ),
        CardData(
          titulo: 'Triangulo de seguridad',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Triangulo de seguridad'])
          },
        ),
        CardData(
          titulo: 'Bocinas',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Bocinas'])
          },
        ),
        CardData(
          titulo: 'Luces',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Luces'])
          },
        ),
        CardData(
          titulo: 'Tag',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Tag'])
          },
        ),
        CardData(
          titulo: 'Vial pass',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Vial pass'])
          },
        ),
        CardData(
          titulo: 'Sim Card',
          subtitulo: '',
          tooltip: 'tooltip',
          theme: theme,
          accion: () => {
            pasarRuta(datos: [ruta, 'Sim Card'])
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            'LLantas',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ),
        RowInputLine(textForm1: 'Marca', textForm2: 'Medida'),
        ClientForm(
          hint: 'Cantidad',
          tecladoType: TextInputType.number,
        ),
        SaveButton(color: Colors.cyan),
      ],
    );
  }
}

class CardList extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String tooltip;
  final IconData okOrFailIcon;
  final Color iconoColor;
  final Color fondoColor;
  final Function accion;

  CardList({
    @required this.titulo,
    @required this.subtitulo,
    @required this.tooltip,
    @required this.okOrFailIcon,
    @required this.iconoColor,
    @required this.fondoColor,
    @required this.accion,
  });
  @override
  Widget build(BuildContext context) {
    final cardState = Provider.of<CardState>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
        color: cardState.fondoColor,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            HapticFeedback.vibrate();
            Navigator.of(context)
                .pushNamed('/seleccion', arguments: this.subtitulo)
                .then((value) {
              if (value != null) {
                cardState.subtitulo = value;
                cardState.okOrFailIcon = Icons.check;
                cardState.iconoColor = Colors.green;
                cardState._fondoColor = Colors.cyan[100];
                print(cardState.subtitulo);
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
                        this.titulo,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                      Consumer<CardState>(
                        builder: (_, cardState, __) => CircleAvatar(
                          backgroundColor: Colors.grey[400],
                          child: Icon(
                            cardState.okOrFailIcon,
                            color: cardState.iconoColor,
                            size: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Consumer<CardState>(
                    builder: (_, cardState, __) => Text(
                      '${cardState.subtitulo}',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                      textAlign: TextAlign.left,
                    ),
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

class RowInputLine extends StatelessWidget {
  final String textForm1;
  final String textForm2;
  const RowInputLine({
    @required this.textForm1,
    @required this.textForm2,
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
        ),
        ClientForm(
          hint: this.textForm2,
        ),
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
            hintStyle: TextStyle(color: Colors.cyan),
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
