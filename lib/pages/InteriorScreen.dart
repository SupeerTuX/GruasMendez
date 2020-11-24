import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:mrd_interfaz/models/Temas.dart';
import 'package:mrd_interfaz/models/Contenido.dart';
import 'package:mrd_interfaz/models/DataModel.dart';
import 'package:mrd_interfaz/utils/utils.dart';
import 'package:mrd_interfaz/widget/utils/HeaderLogo.dart';
import 'package:mrd_interfaz/widget/utils/Input.dart';
import 'package:mrd_interfaz/widget/ClienteScreenWidget/ClientData.dart';
import 'package:mrd_interfaz/models/autocomplete_data.dart';

const String routeName = '/seleccion';
//Manejo del estado del las CardList

class InteriorScreen extends StatefulWidget {
  @override
  _InteriorScreenState createState() => _InteriorScreenState();
}

GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

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
        key: scaffoldState,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //print(mapInterior);
            printMap(map: mapInterior);
            HapticFeedback.vibrate();
            bool validacion = true;
            mapInterior.forEach((key, value) {
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

class InteriorBody extends StatefulWidget {
  @override
  _InteriorBodyState createState() => _InteriorBodyState();
}

class _InteriorBodyState extends State<InteriorBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Header(
          imageAsset: 'assets/coche.png',
          titulo: 'Interior Del Vehiculo',
          subtitulo: 'Capture la informacion solicitada',
        ),
        CardDataInterior(contenido: tablero),
        CardDataInterior(contenido: volante),
        CardDataInterior(contenido: radio),
        CardDataInterior(contenido: equipoDeSonido),
        CardDataInterior(contenido: encendedor),
        CardDataInterior(contenido: espejo),
        CardDataInterior(contenido: asientos),
        CardDataInterior(contenido: tapetesDeAlfombra),
        CardDataInterior(contenido: tapetesDeHule),
        CardDataInterior(contenido: extintor),
        CardDataInterior(contenido: gatoManeral),
        CardDataInterior(contenido: trianguloDeSeguridad),
        CardDataInterior(contenido: bocinas),
        CardDataInterior(contenido: luces),
        CardDataInterior(contenido: tag),
        CardDataInterior(contenido: vialPass),
        CardDataInterior(contenido: simCard),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            color: Colors.cyan[200],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Llantas',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
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
              mapInterior['MarcaLlantas'] = value;
              print('Marca de llanta ${mapInterior['MarcaLlantas']}');
              setState(() {
                formData['MarcaLlantas'] = value;
              });
            },
          ),
        ),
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
              mapInterior['MedidaLlantas'] = value;
              print('Rodada ${mapInterior['MedidaLlantas']}');
              setState(() {
                formData['MedidaLlantas'] = value;
              });
            },
          ),
        ),
        InputText(
          hint: 'Cantidad',
          controller: formController.controller[13],
          theme: formController.theme[13],
          capitalization: TextCapitalization.sentences,
          inputType: TextInputType.number,
          accion: () {
            print('Cantidad: ${formController.controller[13].text}');

            if (isNumeric(formController.controller[13].text)) {
              mapInterior['CantidadLlantas'] =
                  formController.controller[13].text;
            } else {
              formController.controller[13].text = '';
              mapInterior['CantidadLlantas'] =
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
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  bool isNumeric(String s) {
    if (s == null) return false;
    return int.tryParse(s) != null;
  }
}
