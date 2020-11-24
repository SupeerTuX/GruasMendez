import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:mrd_interfaz/models/DataModel.dart';
import 'package:mrd_interfaz/models/Temas.dart';
import 'package:mrd_interfaz/models/Contenido.dart';
import 'package:mrd_interfaz/utils/utils.dart';
import 'package:mrd_interfaz/widget/utils/HeaderLogo.dart';
import 'package:mrd_interfaz/widget/utils/Input.dart';
import 'package:mrd_interfaz/widget/ClienteScreenWidget/ClientData.dart';
import 'package:mrd_interfaz/models/autocomplete_data.dart';

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
            printMap(map: mapMotor);
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
        CardDataMotor(contenido: radiador),
        CardDataMotor(contenido: motoventilador),
        CardDataMotor(contenido: alternador),
        CardDataMotor(contenido: cableDeBujias),
        CardDataMotor(contenido: depurador),
        CardDataMotor(contenido: carburador),
        CardDataMotor(contenido: filtroDeAire),
        CardDataMotor(contenido: inyectores),
        CardDataMotor(contenido: compresor),
        CardDataMotor(contenido: computadora),
        CardDataMotor(contenido: bateria),
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
        MarcaField(),
        //? Carga
        InputText(
          hint: 'Carga Consiste En',
          controller: formController.controller[15],
          theme: formController.theme[15],
          capitalization: TextCapitalization.sentences,
          clearDefault: () {
            formController.controller[15].clear();
            print('Carga consite en: ${formController.controller[15].text}');
            mapMotor['CargaConsistente'] = formController.controller[15].text;
            setState(() {
              formController.controller[15].text.isEmpty
                  ? formController.theme[15] = inputThemeFail
                  : formController.theme[15] = inputThemeOK;
            });
          },
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
        //? Observaciones
        InputText(
          hint: 'Observaciones',
          controller: formController.controller[16],
          theme: formController.theme[16],
          capitalization: TextCapitalization.sentences,
          clearDefault: () {
            formController.controller[16].clear();
            print('Observaciones: ${formController.controller[16].text}');
            mapMotor['Observaciones'] = formController.controller[16].text;
            setState(() {
              formController.controller[16].text.isEmpty
                  ? formController.theme[16] = inputThemeFail
                  : formController.theme[16] = inputThemeOK;
            });
          },
          accion: () {
            print('Observaciones: ${formController.controller[16].text}');
            mapMotor['Observaciones'] = formController.controller[16].text;
            setState(() {
              formController.controller[16].text.isEmpty
                  ? formController.theme[16] = inputThemeFail
                  : formController.theme[16] = inputThemeOK;
            });
          },
        ),
        SizedBox(height: 20),
        Divider(),
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

class MarcaField extends StatefulWidget {
  @override
  _MarcaFieldState createState() => _MarcaFieldState();
}

class _MarcaFieldState extends State<MarcaField> {
  //String inputText = '';
  List<String> marcas = [];
  Map<String, dynamic> data;

  @override
  void initState() {
    parseJsonFromAssets('assets/json/modelo.json').then((value) => {
          data = value,
          //print(data),
          data['marca'].forEach((key, value) {
            marcas.add(key);
          }),
          //print(marcas)
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropDownField(
        value: formData['MarcaMotor'],
        icon: Icon(Icons.car_repair),
        required: true,
        hintText: 'Motor',
        labelText: 'Marca de motor',
        items: marcas,
        strict: false,
        onValueChanged: (value) {
          mapMotor['MarcaMotor'] = value;
          print('Marca de auto ${mapMotor['MarcaMotor']}');
          setState(() {
            formData['MarcaMotor'] = value;
            //print(formData);
          });
        },
      ),
    );
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    //print('--- Parse json from: $assetsPath');
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }
}
