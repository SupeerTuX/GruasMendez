import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:bluetoothonoff/bluetoothonoff.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

class BTConfigScreen extends StatefulWidget {
  @override
  _BTConfigScreenState createState() => _BTConfigScreenState();
}

class _BTConfigScreenState extends State<BTConfigScreen> {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  List<BluetoothDevice> _devices = [];
  BluetoothDevice _device;
  bool _connected = false;
  bool _pressed = false;
  bool isSwitched = false;
  bool success = false;
  String pathImage;
  //Ticket ticket = new Ticket();

  @override
  void initState() {
    super.initState();

    //ticket.testString();
    bluetooth.isOn.then((value) {
      print('Bluetooth: $value');
      isSwitched = value;
      success = true;
    });

    bluetooth.isConnected.then((value) {
      if (value) {
        _connected = true;
        success = true;
      }
    });
    initPlatformState();
    initSavetoPath();
  }

  initSavetoPath() async {
    //read and write
    //image max 300px X 300px
    final filename = 'logo_ticket.png';
    var bytes = await rootBundle.load("assets/logo_ticket.png");
    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes, '$dir/$filename');
    setState(() {
      pathImage = '$dir/$filename';
    });
  }

  Future<void> scann() async {
    List<BluetoothDevice> devices = [];
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      // TODO - Error
    }

    setState(() {
      _devices = devices;
    });
  }

  Future<void> initPlatformState() async {
    List<BluetoothDevice> devices = [];

    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      // TODO - Error
    }

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          setState(() {
            _connected = true;
            _pressed = false;
          });
          break;
        case BlueThermalPrinter.DISCONNECTED:
          setState(() {
            _connected = false;
            _pressed = false;
          });
          break;
        case BlueThermalPrinter.STATE_ON:
          scann();
          break;
        case BlueThermalPrinter.STATE_OFF:
          setState(() {
            if (_connected) {
              _disconnect();
            }
            _connected = false;
            //_pressed = true;
          });
          break;
        default:
          print(state);
          break;
      }
    });

    if (!mounted) return;
    setState(() {
      _devices = devices;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text('Impresora Bluetooth'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Activar Bluetooth',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Switch(
                      value: isSwitched,
                      onChanged: (sw) {
                        isSwitched = sw;
                        //Mandamos a encender o apagar el bluetooth
                        if (isSwitched) {
                          print('Encendiendo BT');
                          BluetoothOnOff.turnOnBluetooth.then((value) {
                            print('BT: $value');
                            show('Activando Bluettoth');
                            setState(() {
                              isSwitched = true;
                              success = true;
                              _pressed = false;
                            });
                          });
                        } else {
                          print('Apagando BT');
                          bluetooth.isConnected.then((isConnected) {
                            if (isConnected) {
                              _disconnect();
                            }
                            BluetoothOnOff.turnOffBluetooth.then((value) {
                              print('BT: $value');
                              show('Desactivando Bluetooth');
                              setState(() {
                                isSwitched = false;
                                success = false;
                              });
                            });
                          });
                        }
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Dispositivos Vinculados',
                style: TextStyle(fontSize: 20.0, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 0.0),
              child: Card(
                color: Colors.grey[300],
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Device:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DropdownButton(
                        items: _getDeviceItems(),
                        onChanged: (value) => setState(() => _device = value),
                        value: _device,
                      ),
                      RaisedButton(
                        color: Colors.blue[200],
                        onPressed: _pressed
                            ? null
                            : _connected ? _disconnect : _connect,
                        child: Text(_connected ? 'Disconnect' : 'Connect'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 50),
              child: RaisedButton(
                onPressed: _connected ? _tesPrint : null,
                child: Text('Test de impresion'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 100),
              child: Text(
                'NOTA: Si no puedes encontrar el dispositivo en la lista, debes vincularlo en el menu de configuracion de bluethoot android',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100, top: 10),
              child: RaisedButton(
                onPressed: () {},
                child: Text('Bluetooth Ajustes'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devices.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      _devices.forEach((device) {
        items.add(DropdownMenuItem(
          child: Text(device.name),
          value: device,
        ));
      });
    }
    return items;
  }

  void _connect() {
    if (_device == null) {
      show('No device selected.');
    } else {
      bluetooth.isConnected.then((isConnected) {
        if (!isConnected && success) {
          bluetooth.connect(_device).catchError((error) {
            show('No se encontro el dispositivo');
            setState(() => _pressed = false);
          });
          setState(() => _pressed = true);
        } else {
          show('Debe encender el Bluetooth');
        }
      });
    }
  }

  void _disconnect() {
    if (success) {
      bluetooth.disconnect();
      setState(() => _pressed = true);
    }
  }

//write to app path
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  void _tesPrint() async {
    //SIZE
    // 0- normal size text
    // 1- only bold text
    // 2- bold with medium text
    // 3- bold with large text
    //ALIGN
    // 0- ESC_ALIGN_LEFT
    // 1- ESC_ALIGN_CENTER
    // 2- ESC_ALIGN_RIGHT
    bluetooth.isConnected.then((isConnected) {
      if (isConnected) {
        bluetooth.printCustom("HEADER", 3, 1);
        bluetooth.printImage(pathImage);
        bluetooth.printNewLine();
        bluetooth.printLeftRight("Test ok", "TEST OK", 0);
        bluetooth.printCustom("TEST DE IMPRESION", 2, 1);
        bluetooth.printCustom("TEST DE IMPRESION", 1, 1);
        bluetooth.printQRcode("Insert Your Own Text to Generate", 200, 200, 0);
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.printNewLine();
        bluetooth.paperCut();
      }
    });
  }

  Future show(
    String message, {
    Duration duration: const Duration(seconds: 3),
  }) async {
    await new Future.delayed(new Duration(milliseconds: 100));
    scaffoldState.currentState
        .showSnackBar(new SnackBar(content: Text(message)));
  }
}
