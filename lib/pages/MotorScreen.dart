import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrd_interfaz/models/DataModel.dart';
import 'package:mrd_interfaz/models/Temas.dart';
import 'package:mrd_interfaz/models/Contenido.dart';
import 'package:mrd_interfaz/widget/utils/HeaderLogo.dart';
import 'package:mrd_interfaz/widget/utils/Input.dart';
import 'package:mrd_interfaz/widget/ClienteScreenWidget/ClientData.dart';

//Rura de la pagina de seleccion
const String routeName = '/seleccion';

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

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
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
        key: scaffoldState,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //print(mapMotor);
            HapticFeedback.vibrate();
            bool validacion = true;
            mapMotor.forEach((key, value) {
              if (value == '') {
                print('Valor $key: $value');
                print('Validacion = $validacion');
                validacion = false;
              }
            });

            if (validacion) {
              scaffoldState.currentState.showSnackBar(
                  new SnackBar(content: Text('Datos guardados correctamente')));
              Navigator.of(context).pop(validacion);
            } else {
              scaffoldState.currentState.showSnackBar(new SnackBar(
                  content: Text('No se han capturado todos los datos')));
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.tealAccent[400],
        ),
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
  double _gasValue = 0.0;
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
            contenido: radiador,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: radiador.titulo)
                  .then((value) {
                setState(() {
                  radiador.theme = themeOk;
                  radiador.subtitulo = value;
                  mapMotor['Radiador'] = value;
                });
              });
            }),
        CardData(
            contenido: motoventilador,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: motoventilador.titulo)
                  .then((value) {
                setState(() {
                  motoventilador.theme = themeOk;
                  motoventilador.subtitulo = value;
                  mapMotor['Motoventilador'] = value;
                });
              });
            }),
        CardData(
            contenido: alternador,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: alternador.titulo)
                  .then((value) {
                setState(() {
                  alternador.theme = themeOk;
                  alternador.subtitulo = value;
                  mapMotor['Alternador'] = value;
                });
              });
            }),
        CardData(
            contenido: cableDeBujias,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: cableDeBujias.titulo)
                  .then((value) {
                setState(() {
                  cableDeBujias.theme = themeOk;
                  cableDeBujias.subtitulo = value;
                  mapMotor['CableDeBujias'] = value;
                });
              });
            }),
        CardData(
            contenido: depurador,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: depurador.titulo)
                  .then((value) {
                setState(() {
                  depurador.theme = themeOk;
                  depurador.subtitulo = value;
                  mapMotor['Depurador'] = value;
                });
              });
            }),
        CardData(
            contenido: carburador,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: carburador.titulo)
                  .then((value) {
                setState(() {
                  carburador.theme = themeOk;
                  carburador.subtitulo = value;
                  mapMotor['Carburador'] = value;
                });
              });
            }),
        CardData(
            contenido: filtroDeAire,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: filtroDeAire.titulo)
                  .then((value) {
                setState(() {
                  filtroDeAire.theme = themeOk;
                  filtroDeAire.subtitulo = value;
                  mapMotor['FiltroAire'] = value;
                });
              });
            }),
        CardData(
            contenido: inyectores,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: inyectores.titulo)
                  .then((value) {
                setState(() {
                  inyectores.theme = themeOk;
                  inyectores.subtitulo = value;
                  mapMotor['Inyectores'] = value;
                });
              });
            }),
        CardData(
            contenido: compresor,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: compresor.titulo)
                  .then((value) {
                setState(() {
                  compresor.theme = themeOk;
                  compresor.subtitulo = value;
                  mapMotor['Compresor'] = value;
                });
              });
            }),
        CardData(
            contenido: computadora,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: computadora.titulo)
                  .then((value) {
                setState(() {
                  computadora.theme = themeOk;
                  computadora.subtitulo = value;
                  mapMotor['Computadora'] = value;
                });
              });
            }),
        CardData(
            contenido: bateria,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: bateria.titulo)
                  .then((value) {
                setState(() {
                  bateria.theme = themeOk;
                  bateria.subtitulo = value;
                  mapMotor['Bateria'] = value;
                });
              });
            }),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 18.0),
          child: Text(
            'Combustible en el tanque: $_gasValue%',
            style: TextStyle(fontSize: 16.0, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red[700],
            inactiveTrackColor: Colors.red[100],
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 4.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.red[700],
            inactiveTickMarkColor: Colors.red[100],
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Slider(
            value: _gasValue,
            min: 0,
            max: 100,
            divisions: 10,
            label: '$_gasValue%',
            onChanged: (value) {
              setState(() {
                _gasValue = value;
                mapMotor['TanqueGasolina'] = _gasValue.toString();
              });
            },
          ),
        ),
        InputText(
          hint: 'Marca De Motor',
          controller: formController.controller[14],
          theme: formController.theme[14],
          capitalization: TextCapitalization.sentences,
          accion: () {
            print('Marca de motor: ${formController.controller[14].text}');
            mapMotor['MarcaMotor'] = formController.controller[14].text;
            setState(() {
              formController.controller[14].text.isEmpty
                  ? formController.theme[14] = inputThemeFail
                  : formController.theme[14] = inputThemeOK;
            });
          },
        ),
        InputText(
          hint: 'Carga Consiste En',
          controller: formController.controller[15],
          theme: formController.theme[15],
          capitalization: TextCapitalization.sentences,
          accion: () {
            print('Carga consite en: ${formController.controller[15].text}');
            mapMotor['CargaConsistente'] = formController.controller[15].text;
            setState(() {
              formController.controller[15].text.isEmpty
                  ? formController.theme[15] = inputThemeFail
                  : formController.theme[15] = inputThemeOK;
            });
          },
        ),
        InputText(
          hint: 'Observaciones',
          controller: formController.controller[16],
          theme: formController.theme[16],
          capitalization: TextCapitalization.sentences,
          accion: () {
            print('Carga consite en: ${formController.controller[16].text}');
            mapMotor['Observaciones'] = formController.controller[16].text;
            setState(() {
              formController.controller[16].text.isEmpty
                  ? formController.theme[16] = inputThemeFail
                  : formController.theme[16] = inputThemeOK;
            });
          },
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
