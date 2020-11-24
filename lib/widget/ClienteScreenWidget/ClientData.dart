import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mrd_interfaz/models/DataModel.dart';

import 'package:mrd_interfaz/models/Contenido.dart';
import 'package:mrd_interfaz/models/Temas.dart';

//Valores de los radio buttons
//enum SingingCharacter { bien, mal, na }

//? Data Externo
class CardData extends StatefulWidget {
  final CardCustomContent contenido;

  CardData({
    @required this.contenido,
  });

  @override
  _CardDataState createState() => _CardDataState();
}

class _CardDataState extends State<CardData> {
  SingingCharacter _character;
  Color labelColor = Colors.red;
  TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _character = widget.contenido.opcion;

    if (widget.contenido.fieldNumeric) {
      if (isNumeric(mapExterior[widget.contenido.key])) {
        _controller.text = mapExterior[widget.contenido.key];
        labelColor = Colors.green;
      } else {
        //mapExterior[widget.contenido.key] = '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
        color: widget.contenido.theme.cardBackground,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      widget.contenido.titulo,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //color: Colors.greenAccent[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: SingingCharacter.si,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              HapticFeedback.vibrate();
                              setState(() {
                                _character = value;
                                if (widget.contenido.fieldNumeric) {
                                  mapExterior[widget.contenido.key] = '';
                                } else {
                                  mapExterior[widget.contenido.key] = 'Si';
                                }
                                widget.contenido.opcion = value;
                                widget.contenido.theme = themeOk;
                                widget.contenido.showTextField = true;
                                //_colorCard = Colors.greenAccent[100];
                                print(
                                    '${widget.contenido.key}: ${mapExterior[widget.contenido.key]} ');
                              });
                            },
                          ),
                          Text('Si'),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: SingingCharacter.no,
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            HapticFeedback.vibrate();
                            setState(() {
                              _character = value;
                              mapExterior[widget.contenido.key] = 'No';
                              widget.contenido.opcion = value;
                              widget.contenido.theme = themeWarning;
                              widget.contenido.showTextField = false;
                              print(
                                  '${widget.contenido.key}: ${mapExterior[widget.contenido.key]} ');
                              //_colorCard = Colors.orange[100];
                            });
                          },
                        ),
                        Text('No'),
                      ],
                    ),
                    Container(
                      width: 70,
                      child: widget.contenido.fieldNumeric
                          ? widget.contenido.showTextField
                              ? TextField(
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    labelText: 'Cantidad',
                                    labelStyle: TextStyle(color: labelColor),
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    if (isNumeric(value)) {
                                      setState(() {
                                        labelColor = Colors.green;
                                        mapExterior[widget.contenido.key] =
                                            value;
                                        print(
                                            '${widget.contenido.key}: ${mapExterior[widget.contenido.key]} ');
                                      });
                                    } else {
                                      setState(() {
                                        labelColor = Colors.red;
                                        _controller.text = '';
                                        mapExterior[widget.contenido.key] = '';
                                        print(
                                            '${widget.contenido.key}: ${mapExterior[widget.contenido.key]} ');
                                      });
                                      final snackBar = SnackBar(
                                        content:
                                            Text('Debe ingresar un numero'),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                  onSubmitted: (value) {
                                    if (isNumeric(value)) {
                                      setState(() {
                                        labelColor = Colors.green;
                                        mapExterior[widget.contenido.key] =
                                            value;
                                        print(
                                            '${widget.contenido.key}: ${mapExterior[widget.contenido.key]} ');
                                      });
                                    } else {
                                      setState(() {
                                        labelColor = Colors.red;
                                        _controller.text = '';
                                        mapExterior[widget.contenido.key] = '';
                                        print(
                                            '${widget.contenido.key}: ${mapExterior[widget.contenido.key]} ');
                                      });
                                      final snackBar = SnackBar(
                                        content:
                                            Text('Debe ingresar un numero'),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                )
                              : null
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isNumeric(String s) {
    if (s == null) return false;

    return int.tryParse(s) != null;
  }
}

//?##############################################
//?Card data Interior
//?##############################################

class CardDataInterior extends StatefulWidget {
  final CardCustomContent contenido;

  CardDataInterior({
    @required this.contenido,
  });

  @override
  _CardDataInteriorState createState() => _CardDataInteriorState();
}

class _CardDataInteriorState extends State<CardDataInterior> {
  SingingCharacter _character;
  Color labelColor = Colors.red;
  TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _character = widget.contenido.opcion;

    if (widget.contenido.fieldNumeric) {
      if (isNumeric(mapInterior[widget.contenido.key])) {
        _controller.text = mapInterior[widget.contenido.key];
        labelColor = Colors.green;
      } else {
        //mapInterior[widget.contenido.key] = '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
        color: widget.contenido.theme.cardBackground,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      widget.contenido.titulo,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //color: Colors.greenAccent[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: SingingCharacter.si,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              HapticFeedback.vibrate();
                              setState(() {
                                _character = value;
                                if (widget.contenido.fieldNumeric) {
                                  mapInterior[widget.contenido.key] = '';
                                } else {
                                  mapInterior[widget.contenido.key] = 'Si';
                                }
                                widget.contenido.opcion = value;
                                widget.contenido.theme = themeOk;
                                widget.contenido.showTextField = true;
                                //_colorCard = Colors.greenAccent[100];
                                print(
                                    '${widget.contenido.key}: ${mapInterior[widget.contenido.key]} ');
                              });
                            },
                          ),
                          Text('Si'),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: SingingCharacter.no,
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            HapticFeedback.vibrate();
                            setState(() {
                              _character = value;
                              mapInterior[widget.contenido.key] = 'No';
                              widget.contenido.opcion = value;
                              widget.contenido.theme = themeWarning;
                              widget.contenido.showTextField = false;
                              //_colorCard = Colors.orange[100];
                              print(
                                  '${widget.contenido.key}: ${mapInterior[widget.contenido.key]} ');
                            });
                          },
                        ),
                        Text('No'),
                      ],
                    ),
                    Container(
                      width: 70,
                      child: widget.contenido.fieldNumeric
                          ? widget.contenido.showTextField
                              ? TextField(
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    labelText: 'Cantidad',
                                    labelStyle: TextStyle(color: labelColor),
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    print(_controller.text);
                                    if (isNumeric(value)) {
                                      setState(() {
                                        labelColor = Colors.green;
                                        mapInterior[widget.contenido.key] =
                                            value;
                                        print(
                                            '${widget.contenido.key}: ${mapInterior[widget.contenido.key]} ');
                                      });
                                    } else {
                                      setState(() {
                                        labelColor = Colors.red;
                                        _controller.text = '';
                                        mapInterior[widget.contenido.key] = '';
                                        print(
                                            '${widget.contenido.key}: ${mapInterior[widget.contenido.key]} ');
                                      });
                                      final snackBar = SnackBar(
                                        content:
                                            Text('Debe ingresar un numero'),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                  onSubmitted: (value) {
                                    print(_controller.text);
                                    if (isNumeric(value)) {
                                      setState(() {
                                        labelColor = Colors.green;
                                        mapInterior[widget.contenido.key] =
                                            value;
                                      });
                                    } else {
                                      setState(() {
                                        labelColor = Colors.red;
                                        _controller.text = '';
                                        mapInterior[widget.contenido.key] = '';
                                      });
                                      final snackBar = SnackBar(
                                        content:
                                            Text('Debe ingresar un numero'),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                )
                              : null
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isNumeric(String s) {
    if (s == null) return false;

    return int.tryParse(s) != null;
  }
}

//?##############################################
//?Card data Motor
//?##############################################

class CardDataMotor extends StatefulWidget {
  final CardCustomContent contenido;

  CardDataMotor({
    @required this.contenido,
  });

  @override
  _CardDataMotorState createState() => _CardDataMotorState();
}

class _CardDataMotorState extends State<CardDataMotor> {
  SingingCharacter _character;
  Color labelColor = Colors.red;
  TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _character = widget.contenido.opcion;

    if (widget.contenido.fieldNumeric) {
      if (isNumeric(mapMotor[widget.contenido.key])) {
        _controller.text = mapMotor[widget.contenido.key];
        labelColor = Colors.green;
      } else {
        //mapMotor[widget.contenido.key] = '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
        color: widget.contenido.theme.cardBackground,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      widget.contenido.titulo,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //color: Colors.greenAccent[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: SingingCharacter.si,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              HapticFeedback.vibrate();
                              setState(() {
                                _character = value;
                                if (widget.contenido.fieldNumeric) {
                                  mapMotor[widget.contenido.key] = '';
                                } else {
                                  mapMotor[widget.contenido.key] = 'Si';
                                }
                                widget.contenido.opcion = value;
                                widget.contenido.theme = themeOk;
                                widget.contenido.showTextField = true;
                                //_colorCard = Colors.greenAccent[100];
                                print(
                                    '${widget.contenido.key}: ${mapMotor[widget.contenido.key]} ');
                              });
                            },
                          ),
                          Text('Si'),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: SingingCharacter.no,
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            HapticFeedback.vibrate();
                            setState(() {
                              _character = value;
                              mapMotor[widget.contenido.key] = 'No';
                              widget.contenido.opcion = value;
                              widget.contenido.theme = themeWarning;
                              widget.contenido.showTextField = false;
                              //_colorCard = Colors.orange[100];
                              print(
                                  '${widget.contenido.key}: ${mapMotor[widget.contenido.key]} ');
                            });
                          },
                        ),
                        Text('No'),
                      ],
                    ),
                    Container(
                      width: 70,
                      child: widget.contenido.showTextField
                          ? widget.contenido.fieldNumeric
                              ? TextField(
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    labelText: 'Cantidad',
                                    labelStyle: TextStyle(color: labelColor),
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    print(_controller.text);
                                    if (isNumeric(value)) {
                                      setState(() {
                                        labelColor = Colors.green;
                                        mapMotor[widget.contenido.key] = value;
                                        print(
                                            '${widget.contenido.key}: ${mapMotor[widget.contenido.key]} ');
                                      });
                                    } else {
                                      setState(() {
                                        labelColor = Colors.red;
                                        _controller.text = '';
                                        mapMotor[widget.contenido.key] = '';
                                        print(
                                            '${widget.contenido.key}: ${mapMotor[widget.contenido.key]} ');
                                      });
                                      final snackBar = SnackBar(
                                        content:
                                            Text('Debe ingresar un numero'),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                  onSubmitted: (value) {
                                    print(_controller.text);
                                    if (isNumeric(value)) {
                                      setState(() {
                                        labelColor = Colors.green;
                                        mapMotor[widget.contenido.key] = value;
                                      });
                                    } else {
                                      setState(() {
                                        labelColor = Colors.red;
                                        _controller.text = '';
                                        mapMotor[widget.contenido.key] = '';
                                      });
                                      final snackBar = SnackBar(
                                        content:
                                            Text('Debe ingresar un numero'),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                )
                              : null
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isNumeric(String s) {
    if (s == null) return false;

    return int.tryParse(s) != null;
  }
}

//?##############################################
//?Card data CheckList Motos
//?##############################################

class CardDataMotos extends StatefulWidget {
  final CardCustomContent contenido;

  CardDataMotos({
    @required this.contenido,
  });

  @override
  _CardDataMotosState createState() => _CardDataMotosState();
}

class _CardDataMotosState extends State<CardDataMotos> {
  SingingCharacter _character;
  Color labelColor = Colors.red;
  TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _character = widget.contenido.opcion;

    if (widget.contenido.fieldNumeric) {
      if (isNumeric(mapCheckListMoto[widget.contenido.key])) {
        _controller.text = mapCheckListMoto[widget.contenido.key];
        labelColor = Colors.green;
      } else {
        //mapMotor[widget.contenido.key] = '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
        color: widget.contenido.theme.cardBackground,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 120,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      widget.contenido.titulo,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //color: Colors.greenAccent[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: SingingCharacter.si,
                            groupValue: _character,
                            onChanged: (SingingCharacter value) {
                              HapticFeedback.vibrate();
                              setState(() {
                                _character = value;
                                if (widget.contenido.fieldNumeric) {
                                  mapCheckListMoto[widget.contenido.key] = '';
                                } else {
                                  mapCheckListMoto[widget.contenido.key] = 'Si';
                                }
                                widget.contenido.opcion = value;
                                widget.contenido.theme = themeOk;
                                widget.contenido.showTextField = true;
                                //_colorCard = Colors.greenAccent[100];
                                print(
                                    '${widget.contenido.key}: ${mapCheckListMoto[widget.contenido.key]} ');
                              });
                            },
                          ),
                          Text('Si'),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio(
                          value: SingingCharacter.no,
                          groupValue: _character,
                          onChanged: (SingingCharacter value) {
                            HapticFeedback.vibrate();
                            setState(() {
                              _character = value;
                              mapCheckListMoto[widget.contenido.key] = 'No';
                              widget.contenido.opcion = value;
                              widget.contenido.theme = themeWarning;
                              widget.contenido.showTextField = false;
                              //_colorCard = Colors.orange[100];
                              print(
                                  '${widget.contenido.key}: ${mapCheckListMoto[widget.contenido.key]} ');
                            });
                          },
                        ),
                        Text('No'),
                      ],
                    ),
                    Container(
                      width: 70,
                      child: widget.contenido.showTextField
                          ? widget.contenido.fieldNumeric
                              ? TextField(
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    labelText: 'Cantidad',
                                    labelStyle: TextStyle(color: labelColor),
                                  ),
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    print(_controller.text);
                                    if (isNumeric(value)) {
                                      setState(() {
                                        labelColor = Colors.green;
                                        mapCheckListMoto[widget.contenido.key] =
                                            value;
                                        print(
                                            '${widget.contenido.key}: ${mapCheckListMoto[widget.contenido.key]} ');
                                      });
                                    } else {
                                      setState(() {
                                        labelColor = Colors.red;
                                        _controller.text = '';
                                        mapCheckListMoto[widget.contenido.key] =
                                            '';
                                        print(
                                            '${widget.contenido.key}: ${mapCheckListMoto[widget.contenido.key]} ');
                                      });
                                      final snackBar = SnackBar(
                                        content:
                                            Text('Debe ingresar un numero'),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                  onSubmitted: (value) {
                                    print(_controller.text);
                                    if (isNumeric(value)) {
                                      setState(() {
                                        labelColor = Colors.green;
                                        mapCheckListMoto[widget.contenido.key] =
                                            value;
                                      });
                                    } else {
                                      setState(() {
                                        labelColor = Colors.red;
                                        _controller.text = '';
                                        mapCheckListMoto[widget.contenido.key] =
                                            '';
                                      });
                                      final snackBar = SnackBar(
                                        content:
                                            Text('Debe ingresar un numero'),
                                      );
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  },
                                )
                              : null
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isNumeric(String s) {
    if (s == null) return false;

    return int.tryParse(s) != null;
  }
}

//******************************** */

class CardDataCliente extends StatefulWidget {
  final CardCustomContent contenido;
  final Function accion;

  CardDataCliente({
    @required this.contenido,
    @required this.accion,
  });

  @override
  _CardDataClienteState createState() => _CardDataClienteState();
}

class _CardDataClienteState extends State<CardDataCliente> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
        color: widget.contenido.theme.cardBackground,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            HapticFeedback.vibrate();
            this.widget.accion();
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
                        widget.contenido.titulo,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          widget.contenido.theme.icon,
                          color: widget.contenido.theme.iconColor,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.contenido.subtitulo,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
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

class Llaves extends StatefulWidget {
  @override
  _LlavesState createState() => _LlavesState();
}

class _LlavesState extends State<Llaves> {
  bool isSwitched = false;
  String label = 'No';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Llaves: '),
        Text(label),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              HapticFeedback.vibrate();
              value ? label = 'Si' : label = 'No';
              mapCliente['Llaves'] = label;
            });
          },
        )
      ],
    );
  }
}
