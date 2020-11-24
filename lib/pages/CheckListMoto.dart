import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:mrd_interfaz/models/DataModel.dart';
import 'package:mrd_interfaz/models/Temas.dart';
import 'package:mrd_interfaz/models/autocomplete_data.dart';
import 'package:mrd_interfaz/utils/utils.dart';
import 'package:mrd_interfaz/widget/utils/HeaderLogo.dart';
import 'package:mrd_interfaz/widget/ClienteScreenWidget/ClientData.dart';
import 'package:mrd_interfaz/models/Contenido.dart';
import 'package:mrd_interfaz/widget/utils/Input.dart';

class CheckListMoto extends StatefulWidget {
  @override
  _CheckListMotoState createState() => _CheckListMotoState();
}

GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

class _CheckListMotoState extends State<CheckListMoto> {
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
          title: Text('Check List Moto'),
          backgroundColor: Colors.tealAccent[400],
        ),
        body: CheckListBody(),
        key: scaffoldState,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //print(mapExterior);
            printMap(map: mapCheckListMoto);
            bool validacion = true;
            mapCheckListMoto.forEach((key, value) {
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

class CheckListBody extends StatefulWidget {
  @override
  _CheckListBodyState createState() => _CheckListBodyState();
}

class _CheckListBodyState extends State<CheckListBody> {
  double _gasValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Header(
          imageAsset: 'assets/grua.png',
          titulo: 'Exterior Del Vehiculo',
          subtitulo: 'Capture la informacion solicitada',
        ),
        CardDataMotos(contenido: motoAntenas),
        CardDataMotos(contenido: motoAsiento),
        CardDataMotos(contenido: motoBateria),
        CardDataMotos(contenido: motoCadena),
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
                mapCheckListMoto['CantidadDeGasoliona'] = _gasValue.toString();
              });
            },
          ),
        ),
        CardDataMotos(contenido: motoDepositoGasolina),
        CardDataMotos(contenido: motoEmblemas),
        CardDataMotos(contenido: motoEquipoDeSonido),
        CardDataMotos(contenido: motoFaro),
        CardDataMotos(contenido: motoFrenosDelanteros),
        CardDataMotos(contenido: motoFrenosTraseros),
        CardDataMotos(contenido: motoLucesTraseras),
        CardDataMotos(contenido: motoManubrio),
        CardDataMotos(contenido: motoMotor),
        CardDataMotos(contenido: motoPalancaDeCambios),
        CardDataMotos(contenido: motoParabrisas),
        CardDataMotos(contenido: motoPataLateral),
        CardDataMotos(contenido: motoPedalDeClutch),
        CardDataMotos(contenido: motoPedalFrenoDelantero),
        CardDataMotos(contenido: motoPedalFrenoTrasero),
        CardDataMotos(contenido: motoReflejantes),
        CardDataMotos(contenido: motoRetrovisorDerecho),
        CardDataMotos(contenido: motoRetrovisorIzquierdo),
        CardDataMotos(contenido: motoSalpicaderaDelantera),
        CardDataMotos(contenido: motoSalpicaderaTrasera),
        CardDataMotos(contenido: motoTaponGasolina),
        CardDataMotos(contenido: motoTuboDeEscape),
        Divider(),
        //?  Marca De LLantas
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropDownField(
            value: formData['MarcaLlantas'],
            icon: Icon(Icons.lens_rounded),
            required: true,
            hintText: 'Elije La Marca',
            labelText: 'Marca Llanta',
            items: marcaLLantas,
            strict: false,
            onValueChanged: (value) {
              mapCheckListMoto['MarcaLlantas'] = value;
              print('Marca de llanta ${mapCheckListMoto['MarcaLlantas']}');
              setState(() {
                formData['MarcaLlantas'] = value;
              });
            },
          ),
        ),
        //? Medida de llantas
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropDownField(
            value: formData['MedidaLlantas'],
            icon: Icon(Icons.space_bar),
            required: true,
            hintText: 'Elije La Rodada',
            labelText: 'Rodada',
            items: medidaLLantas,
            strict: false,
            onValueChanged: (value) {
              mapCheckListMoto['MedidaLlantas'] = value;
              print('Rodada ${mapCheckListMoto['MedidaLlantas']}');
              setState(() {
                formData['MedidaLlantas'] = value;
              });
            },
          ),
        ),
        //? Cantidad de llantas
        InputText(
          hint: 'Cantidad',
          controller: formController.controller[13],
          theme: formController.theme[13],
          capitalization: TextCapitalization.sentences,
          inputType: TextInputType.number,
          accion: () {
            print('Cantidad: ${formController.controller[13].text}');
            if (isNumeric(formController.controller[13].text)) {
              mapCheckListMoto['CantidadLlantas'] =
                  formController.controller[13].text;
            } else {
              formController.controller[13].text = '';
              mapCheckListMoto['CantidadLlantas'] =
                  formController.controller[13].text;
              scaffoldState.currentState.showSnackBar(
                  new SnackBar(content: Text('Debe ingresar un numero')));
            }
            setState(() {
              formController.controller[13].text.isEmpty
                  ? formController.theme[13] = inputThemeFail
                  : formController.theme[13] = inputThemeOK;
            });
          },
        ),
        Divider(),
        //? Carga
        InputText(
          hint: 'Carga Consiste En',
          controller: formController.controller[17],
          theme: formController.theme[17],
          capitalization: TextCapitalization.sentences,
          accion: () {
            print('Carga Consiste En: ${formController.controller[17].text}');
            mapCheckListMoto['CargaConsistente'] =
                formController.controller[17].text;
            setState(() {
              formController.controller[17].text.isEmpty
                  ? formController.theme[17] = inputThemeFail
                  : formController.theme[17] = inputThemeOK;
            });
          },
        ),
        //? Observaciones
        InputText(
          hint: 'Observaciones',
          controller: formController.controller[18],
          theme: formController.theme[18],
          capitalization: TextCapitalization.sentences,
          accion: () {
            print('Observaciones: ${formController.controller[18].text}');
            mapCheckListMoto['Observaciones'] =
                formController.controller[18].text;
            setState(() {
              formController.controller[18].text.isEmpty
                  ? formController.theme[18] = inputThemeFail
                  : formController.theme[18] = inputThemeOK;
            });
          },
        ),
        Divider(),
        SizedBox(height: 50),
      ],
    );
  }

  bool isNumeric(String s) {
    if (s == null) return false;
    return int.tryParse(s) != null;
  }
}
