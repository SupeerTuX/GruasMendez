import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrd_interfaz/models/Temas.dart';
import 'package:mrd_interfaz/models/Contenido.dart';
import 'package:mrd_interfaz/models/DataModel.dart';
import 'package:mrd_interfaz/widget/utils/HeaderLogo.dart';
import 'package:mrd_interfaz/widget/utils/Input.dart';
import 'package:mrd_interfaz/widget/ClienteScreenWidget/ClientData.dart';

const String routeName = '/seleccion';
//Manejo del estado del las CardList

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

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
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
        CardData(
            contenido: tablero,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: tablero.titulo)
                  .then((value) {
                setState(() {
                  tablero.theme = themeOk;
                  tablero.subtitulo = value;
                  mapInterior['Tablero'] = value;
                });
              });
            }),
        CardData(
            contenido: volante,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: volante.titulo)
                  .then((value) {
                setState(() {
                  volante.theme = themeOk;
                  volante.subtitulo = value;
                  mapInterior['Volante'] = value;
                });
              });
            }),
        CardData(
            contenido: radio,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: radio.titulo)
                  .then((value) {
                setState(() {
                  radio.theme = themeOk;
                  radio.subtitulo = value;
                  mapInterior['Radio'] = value;
                });
              });
            }),
        CardData(
            contenido: equipoDeSonido,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: equipoDeSonido.titulo)
                  .then((value) {
                setState(() {
                  equipoDeSonido.theme = themeOk;
                  equipoDeSonido.subtitulo = value;
                  mapInterior['EquipoSonido'] = value;
                });
              });
            }),
        CardData(
            contenido: encendedor,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: encendedor.titulo)
                  .then((value) {
                setState(() {
                  encendedor.theme = themeOk;
                  encendedor.subtitulo = value;
                  mapInterior['Encendedor'] = value;
                });
              });
            }),
        CardData(
            contenido: espejo,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: espejo.titulo)
                  .then((value) {
                setState(() {
                  espejo.theme = themeOk;
                  espejo.subtitulo = value;
                  mapInterior['Espejo'] = value;
                });
              });
            }),
        CardData(
            contenido: asientos,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: asientos.titulo)
                  .then((value) {
                setState(() {
                  asientos.theme = themeOk;
                  asientos.subtitulo = value;
                  mapInterior['Asientos'] = value;
                });
              });
            }),
        CardData(
            contenido: tapetesDeAlfombra,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: tapetesDeAlfombra.titulo)
                  .then((value) {
                setState(() {
                  tapetesDeAlfombra.theme = themeOk;
                  tapetesDeAlfombra.subtitulo = value;
                  mapInterior['TapetesAlfombra'] = value;
                });
              });
            }),
        CardData(
            contenido: tapetesDeHule,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: tapetesDeHule.titulo)
                  .then((value) {
                setState(() {
                  tapetesDeHule.theme = themeOk;
                  tapetesDeHule.subtitulo = value;
                  mapInterior['TapetesHule'] = value;
                });
              });
            }),
        CardData(
            contenido: extintor,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: extintor.titulo)
                  .then((value) {
                setState(() {
                  extintor.theme = themeOk;
                  extintor.subtitulo = value;
                  mapInterior['Extintor'] = value;
                });
              });
            }),
        CardData(
            contenido: gatoManeral,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: gatoManeral.titulo)
                  .then((value) {
                setState(() {
                  gatoManeral.theme = themeOk;
                  gatoManeral.subtitulo = value;
                  mapInterior['GatoYManeral'] = value;
                });
              });
            }),
        CardData(
            contenido: trianguloDeSeguridad,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: trianguloDeSeguridad.titulo)
                  .then((value) {
                setState(() {
                  trianguloDeSeguridad.theme = themeOk;
                  trianguloDeSeguridad.subtitulo = value;
                  mapInterior['TrianguloDeSeguridad'] = value;
                });
              });
            }),
        CardData(
            contenido: bocinas,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: bocinas.titulo)
                  .then((value) {
                setState(() {
                  bocinas.theme = themeOk;
                  bocinas.subtitulo = value;
                  mapInterior['Bocinas'] = value;
                });
              });
            }),
        CardData(
            contenido: luces,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: luces.titulo)
                  .then((value) {
                setState(() {
                  luces.theme = themeOk;
                  luces.subtitulo = value;
                  mapInterior['Luces'] = value;
                });
              });
            }),
        CardData(
            contenido: tag,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: tag.titulo)
                  .then((value) {
                setState(() {
                  tag.theme = themeOk;
                  tag.subtitulo = value;
                  mapInterior['Tag'] = value;
                });
              });
            }),
        CardData(
            contenido: vialPass,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: vialPass.titulo)
                  .then((value) {
                setState(() {
                  vialPass.theme = themeOk;
                  vialPass.subtitulo = value;
                  mapInterior['VialPass'] = value;
                });
              });
            }),
        CardData(
            contenido: simCard,
            accion: () {
              Navigator.of(context)
                  .pushNamed(routeName, arguments: simCard.titulo)
                  .then((value) {
                setState(() {
                  simCard.theme = themeOk;
                  simCard.subtitulo = value;
                  mapInterior['SimCard'] = value;
                });
              });
            }),
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
        InputText(
          hint: 'Marca',
          controller: formController.controller[11],
          theme: formController.theme[11],
          capitalization: TextCapitalization.sentences,
          accion: () {
            print('Marca: ${formController.controller[11].text}');
            mapInterior['MarcaLlantas'] = formController.controller[11].text;
            setState(() {
              formController.controller[11].text.isEmpty
                  ? formController.theme[11] = inputThemeFail
                  : formController.theme[11] = inputThemeOK;
            });
          },
        ),
        InputText(
          hint: 'Medida',
          controller: formController.controller[12],
          theme: formController.theme[12],
          capitalization: TextCapitalization.sentences,
          accion: () {
            print('Medida: ${formController.controller[12].text}');
            mapInterior['MedidaLlantas'] = formController.controller[12].text;
            setState(() {
              formController.controller[12].text.isEmpty
                  ? formController.theme[12] = inputThemeFail
                  : formController.theme[12] = inputThemeOK;
            });
          },
        ),
        InputText(
          hint: 'Cantidad',
          controller: formController.controller[13],
          theme: formController.theme[13],
          capitalization: TextCapitalization.sentences,
          accion: () {
            print('Cantidad: ${formController.controller[13].text}');
            mapInterior['CantidadLlantas'] = formController.controller[13].text;
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
}
