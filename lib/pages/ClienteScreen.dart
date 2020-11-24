import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:mrd_interfaz/models/Temas.dart';
import 'package:mrd_interfaz/models/Contenido.dart';
import 'package:mrd_interfaz/models/DataModel.dart';
import 'package:mrd_interfaz/models/autocomplete_data.dart';
import 'package:mrd_interfaz/utils/utils.dart';
import 'package:mrd_interfaz/widget/ClienteScreenWidget/ClientData.dart';
import 'package:mrd_interfaz/widget/utils/HeaderLogo.dart';
import 'package:mrd_interfaz/widget/utils/Input.dart';

List<String> modelos = [];
String modeloSelected;
String modeloVehiculo;
TextEditingController _fieldController = new TextEditingController();

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

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Datos Del Cliente'),
          backgroundColor: Colors.orange,
        ),
        body: ClienteBody(),
        key: scaffoldState,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //print(mapCliente);
            printMap(map: mapCliente);
            bool validacion = true;
            mapCliente.forEach((key, value) {
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
          backgroundColor: Colors.tealAccent[400],
          elevation: 15.0,
          child: Icon(Icons.save),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ClienteBody extends StatefulWidget {
  @override
  _ClienteBodyState createState() => _ClienteBodyState();
}

class _ClienteBodyState extends State<ClienteBody> {
  DateTime pickedDate;
  TimeOfDay time;
  //CardCustomTheme tema = themeFail;
  //List<CardCustomTheme> themeList = List.filled(3, themeFail);

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  //Mapa para contener el json de las marcas y modelos
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Header(
                  imageAsset: 'assets/checklist.png',
                  titulo: 'Captura De Informacion',
                  subtitulo: 'Capture los datos del cliente solicitados.',
                ),
                NumeroReporte(),
                CardDataCliente(
                  contenido: fechaHoraContenido,
                  accion: () {
                    print('Captura de hora y fecha');
                    _pickDate().then((valueD) {
                      if (valueD == null) return;
                      _pickTime().then((valueT) {
                        setState(() {
                          if (valueD == null || valueT == null) {
                            fechaHoraContenido.subtitulo =
                                'No se ha ingresado la fecha y hora';
                            fechaHoraContenido.theme = themeFail;
                            mapCliente['Fecha'] = '';
                          } else {
                            if (valueT.minute < 10) {
                              fechaHoraContenido.subtitulo =
                                  'Fecha: ${valueD.day}/${valueD.month}/${valueD.year} -- ${valueT.hour}:0${valueT.minute}:00 ';
                              mapCliente['Fecha'] =
                                  '${valueD.year}-${valueD.month}-${valueD.day} ${valueT.hour}:0${valueT.minute}:00';
                            } else {
                              fechaHoraContenido.subtitulo =
                                  'Fecha: ${valueD.day}/${valueD.month}/${valueD.year} -- ${valueT.hour}:${valueT.minute}:00 ';
                              mapCliente['Fecha'] =
                                  '${valueD.year}-${valueD.month}-${valueD.day} ${valueT.hour}:${valueT.minute}:00';
                            }
                            fechaHoraContenido.theme = themeOk;
                            //Data model
                          }
                        });
                      });
                    });
                  },
                ),
                //Captura de direccion por gps
                CardDataCliente(
                  contenido: direccionContenido,
                  accion: () {
                    print('Captura de direccion por gps');
                    Navigator.of(context).pushNamed('/gps').then((value) {
                      print(value);
                      setState(() {
                        if (value != null) {
                          direccionContenido.theme = themeOk;
                          direccionContenido.subtitulo = value;
                          //Carga de direccion en el modelo
                          mapCliente['Direccion'] = value;
                        } else {
                          direccionContenido.subtitulo =
                              'Capture la direccion del arrastre';
                          direccionContenido.theme = themeFail;
                          //Carga de direccion en el modelo
                          mapCliente['Direccion'] = '';
                        }
                      });
                    });
                  },
                ),
                //Captura de motivo de inventario
                CardDataCliente(
                  contenido: inventarioContenido,
                  accion: () {
                    Navigator.of(context)
                        .pushNamed('/inventario')
                        .then((value) {
                      setState(() {
                        if (value != null) {
                          inventarioContenido.theme = themeOk;
                          inventarioContenido.subtitulo = value;
                          //Carga de direccion en el modelo
                          mapCliente['MotivoInventario'] = value;
                        } else {
                          inventarioContenido.theme = themeFail;
                          //Carga de direccion en el modelo
                          mapCliente['MotivoInventario'] = '';
                        }
                      });
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),

                MarcaField(),
                ModeloField(),

                //? Año del vehiculo
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropDownField(
                    value: formData['ModeloYear'],
                    icon: Icon(Icons.calendar_today),
                    required: true,
                    hintText: 'Año',
                    labelText: 'Año del vehiculo',
                    items: modeloYear,
                    strict: false,
                    onValueChanged: (value) {
                      mapCliente['Year'] = value;
                      print('Modelo year ${mapCliente['Year']}');
                      setState(() {
                        formData['ModeloYear'] = value;
                      });
                    },
                  ),
                ),

                //? Tipo de auto
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropDownField(
                    value: formData['Tipo'],
                    icon: Icon(Icons.car_rental),
                    required: true,
                    hintText: 'Elije el tipo de auto',
                    labelText: 'Tipo',
                    items: tipoVehiculo,
                    strict: false,
                    setter: (newValue) {
                      formData['Tipo'] = newValue;
                    },
                    onValueChanged: (value) {
                      mapCliente['Tipo'] = value;
                      print('Tipo de auto ${mapCliente['Tipo']}');
                      setState(() {
                        formData['Tipo'] = value;
                      });
                    },
                  ),
                ),
                //? Color de vehiculo
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropDownField(
                    value: formData['Color'],
                    icon: Icon(Icons.color_lens),
                    required: true,
                    hintText: 'Elije el color',
                    labelText: 'Color',
                    items: listaColores,
                    strict: false,
                    onValueChanged: (value) {
                      mapCliente['Color'] = value;
                      print('Color de auto ${mapCliente['Color']}');
                      setState(() {
                        formData['Color'] = value;
                      });
                    },
                  ),
                ),
                //?Autoridad
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropDownField(
                    value: formData['Autoridad'],
                    icon: Icon(Icons.policy),
                    required: false,
                    hintText: 'Elije autoridad o solicitante',
                    labelText: 'Autoridad/Solicitante',
                    items: listaClientes,
                    strict: true,
                    onValueChanged: (value) {
                      print('Valor cambiado');
                      mapCliente['Solicitante'] = value;
                      print('Solicitante ${mapCliente['Solicitante']}');
                      setState(() {
                        formData['Autoridad'] = value;
                      });
                    },
                  ),
                ),
                //? Coductor o Propietario
                InputText(
                  hint: 'Conductor o Propiertario',
                  controller: formController.controller[4],
                  theme: formController.theme[4],
                  capitalization: TextCapitalization.words,
                  clearDefault: () {
                    formController.controller[4].clear();
                    print('Serie: ${formController.controller[4].text}');
                    mapCliente['NombreConductor'] =
                        formController.controller[4].text;
                    setState(() {
                      formController.controller[4].text.isEmpty
                          ? formController.theme[4] = inputThemeFail
                          : formController.theme[4] = inputThemeOK;
                    });
                  },
                  accion: () {
                    print('Serie: ${formController.controller[4].text}');
                    mapCliente['NombreConductor'] =
                        formController.controller[4].text;
                    setState(() {
                      formController.controller[4].text.isEmpty
                          ? formController.theme[4] = inputThemeFail
                          : formController.theme[4] = inputThemeOK;
                    });
                  },
                ),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 1,
            ),
            delegate: SliverChildListDelegate(
              [
                //? Placas
                InputText(
                  hint: 'Placas',
                  controller: formController.controller[2],
                  theme: formController.theme[2],
                  capitalization: TextCapitalization.characters,
                  clearDefault: () {
                    formController.controller[2].clear();
                    print('Placas: ${formController.controller[2].text}');
                    mapCliente['Placas'] = formController.controller[2].text;
                    setState(() {
                      formController.controller[2].text.isEmpty
                          ? formController.theme[2] = inputThemeFail
                          : formController.theme[2] = inputThemeOK;
                    });
                  },
                  accion: () {
                    print('Placas: ${formController.controller[2].text}');
                    mapCliente['Placas'] = formController.controller[2].text;
                    setState(() {
                      formController.controller[2].text.isEmpty
                          ? formController.theme[2] = inputThemeFail
                          : formController.theme[2] = inputThemeOK;
                    });
                  },
                ),
                //? No Serie
                InputText(
                  hint: 'No. Serie',
                  controller: formController.controller[3],
                  theme: formController.theme[3],
                  capitalization: TextCapitalization.characters,
                  clearDefault: () {
                    formController.controller[3].text = 'No Aplica';
                    print('Serie: ${formController.controller[3].text}');
                    mapCliente['NoSerie'] = formController.controller[3].text;
                    setState(() {
                      formController.controller[3].text.isEmpty
                          ? formController.theme[3] = inputThemeFail
                          : formController.theme[3] = inputThemeOK;
                    });
                  },
                  accion: () {
                    print('Serie: ${formController.controller[3].text}');
                    mapCliente['NoSerie'] = formController.controller[3].text;
                    setState(() {
                      formController.controller[3].text.isEmpty
                          ? formController.theme[3] = inputThemeFail
                          : formController.theme[3] = inputThemeOK;
                    });
                  },
                ),
                Llaves(),
                //? Telefono
                InputText(
                  hint: 'Telefono',
                  controller: formController.controller[5],
                  theme: formController.theme[5],
                  capitalization: TextCapitalization.sentences,
                  inputType: TextInputType.phone,
                  clearDefault: () {
                    formController.controller[5].text = 'No Aplica';
                    print('Telefono: ${formController.controller[5].text}');
                    mapCliente['Telefono'] = formController.controller[5].text;
                    setState(() {
                      formController.controller[5].text.isEmpty
                          ? formController.theme[5] = inputThemeFail
                          : formController.theme[5] = inputThemeOK;
                    });
                  },
                  accion: () {
                    print('Telefono: ${formController.controller[5].text}');
                    mapCliente['Telefono'] = formController.controller[5].text;
                    setState(() {
                      formController.controller[5].text.isEmpty
                          ? formController.theme[5] = inputThemeFail
                          : formController.theme[5] = inputThemeOK;
                    });
                  },
                ),
                //? Grua
                InputText(
                  hint: 'Grua',
                  controller: formController.controller[6],
                  theme: formController.theme[6],
                  capitalization: TextCapitalization.sentences,
                  clearDefault: () {
                    formController.controller[6].clear();
                    print('Grua: ${formController.controller[6].text}');
                    mapCliente['Grua'] = formController.controller[6].text;
                    setState(() {
                      formController.controller[6].text.isEmpty
                          ? formController.theme[6] = inputThemeFail
                          : formController.theme[6] = inputThemeOK;
                    });
                  },
                  accion: () {
                    print('Grua: ${formController.controller[6].text}');
                    mapCliente['Grua'] = formController.controller[6].text;
                    setState(() {
                      formController.controller[6].text.isEmpty
                          ? formController.theme[6] = inputThemeFail
                          : formController.theme[6] = inputThemeOK;
                    });
                  },
                ),
                //? Clave Operador
                InputText(
                  hint: 'Clave Operador',
                  controller: formController.controller[7],
                  theme: formController.theme[7],
                  capitalization: TextCapitalization.characters,
                  clearDefault: () {
                    formController.controller[7].clear();
                  },
                  accion: () {
                    print('Grua: ${formController.controller[7].text}');
                    mapCliente['ClaveOperador'] =
                        formController.controller[7].text;
                    setState(() {
                      formController.controller[7].text.isEmpty
                          ? formController.theme[7] = inputThemeFail
                          : formController.theme[7] = inputThemeOK;
                    });
                  },
                ),
                SizedBox(height: 50),
                SizedBox(height: 50),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    //print('--- Parse json from: $assetsPath');
    return rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
  }

  Future<DateTime> _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );
    return date;
  }

  Future<TimeOfDay> _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    return t;
  }
}

//TextField autocompletado MARCA
class TextAutoCompleteMarca extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputTheme theme;
  final Function accion;

  TextAutoCompleteMarca({
    @required this.hint,
    @required this.controller,
    @required this.theme,
    @required this.accion,
  });
  @override
  _TextAutoCompleteMarcaState createState() => _TextAutoCompleteMarcaState();
}

class _TextAutoCompleteMarcaState extends State<TextAutoCompleteMarca> {
  String inputText = '';
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
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          onChanged: (value) {
            //widget.accion();
          },
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: this.widget.hint,
            labelStyle: TextStyle(
              color: widget.theme.labelColor,
            ),
          ),
          style: TextStyle(color: widget.theme.textInputColor),
          controller: widget.controller,
        ),
        suggestionsCallback: (pattern) {
          return MarcaService.getSuggestions(pattern, marcas);
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSuggestionSelected: (suggestion) {
          widget.controller.text = suggestion;
          modeloSelected = widget.controller.text;
          parseJsonFromAssets('assets/json/modelo.json').then((value) => {
                data = value,
                modelos.clear(),
                data['marca'][modeloSelected].forEach((key) {
                  modelos.add(key);
                }),
                print(modelos)
              });
          widget.accion();
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

//TextField Autocompletado Modelo
class TextAutocompleteModelo extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final String marca;
  final TextInputTheme theme;
  final Function accion;

  TextAutocompleteModelo({
    @required this.hint,
    @required this.controller,
    @required this.marca,
    @required this.theme,
    @required this.accion,
  });
  @override
  _TextAutocompleteModeloState createState() => _TextAutocompleteModeloState();
}

class _TextAutocompleteModeloState extends State<TextAutocompleteModelo> {
  String inputText = '';
  Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
          onChanged: (value) {
            //widget.accion();
          },
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: this.widget.hint,
            labelStyle: TextStyle(
              color: widget.theme.labelColor,
            ),
          ),
          style: TextStyle(color: widget.theme.textInputColor),
          controller: widget.controller,
          onTap: () {
            widget.controller.text = '';
          },
        ),
        suggestionsCallback: (pattern) {
          //Borramos el contenido
          return MarcaService.getSuggestions(pattern, modelos);
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSuggestionSelected: (suggestion) {
          widget.controller.text = suggestion;
          widget.accion();
        },
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
        value: formData['MarcaAuto'],
        icon: Icon(Icons.car_repair),
        required: true,
        hintText: 'Marca del auto',
        labelText: 'Marca',
        items: marcas,
        strict: false,
        onValueChanged: (value) {
          mapCliente['VahiculoMarca'] = value;
          print('Marca de auto ${mapCliente['VahiculoMarca']}');
          setState(() {
            formData['MarcaAuto'] = value;
            formData['ModeloAuto'] = '';
            _fieldController.clear();
            //print(formData);
          });

          if (formData['MarcaAuto'].isNotEmpty) {
            parseJsonFromAssets('assets/json/modelo.json').then((value) => {
                  data = value,
                  modelos.clear(),
                  data['marca'][formData['MarcaAuto']].forEach((key) {
                    modelos.add(key);
                    print(key);
                  }),
                  print(modelos)
                });
          }
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

class ModeloField extends StatefulWidget {
  @override
  _ModeloFieldState createState() => _ModeloFieldState();
}

class _ModeloFieldState extends State<ModeloField> {
  String inputText = '';
  Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropDownField(
        controller: _fieldController,
        value: formData['ModeloAuto'],
        icon: Icon(Icons.model_training),
        required: true,
        hintText: 'Modelo de auto',
        labelText: 'Modelo',
        items: modelos,
        strict: false,
        onValueChanged: (value) {
          mapCliente['Modelo'] = value;
          print('Modelo de auto ${mapCliente['Modelo']}');
          setState(() {
            formData['ModeloAuto'] = value;
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

//Widget boton para guardar o validar
class ValidacionCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 0.0),
      child: OutlineButton(
        borderSide: BorderSide(color: Colors.orange, width: 2.0),
        child: Text(
          'Guardar Informacion',
          style: TextStyle(fontSize: 18, color: Colors.orange),
        ),
        onPressed: () {
          //HapticFeedback.vibrate();
        },
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
        'REPORTE #: ${mapCliente['Folio']}',
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.redAccent),
      ),
    );
  }
}
