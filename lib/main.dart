import 'package:flutter/material.dart';
import 'package:mrd_interfaz/pages/BTConfig.dart';
import 'package:mrd_interfaz/pages/InteriorScreen.dart';
import 'package:mrd_interfaz/pages/LoginPage.dart';
import 'package:mrd_interfaz/pages/MainScreen.dart';
import 'package:mrd_interfaz/pages/ClienteScreen.dart';
import 'package:mrd_interfaz/pages/ExteriorScreen.dart';
import 'package:mrd_interfaz/pages/ReporteFotograficoScreen.dart';
import 'package:mrd_interfaz/pages/SelectionScreen.dart';
import 'package:mrd_interfaz/pages/MotorScreen.dart';
import 'package:mrd_interfaz/pages/FotoScreen.dart';
import 'package:mrd_interfaz/pages/GpsScreen.dart';
import 'package:mrd_interfaz/pages/MotivoInventario.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gruas Mendez',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/login': (context) => LoginPage(),
        '/main': (context) => MainScreen(),
        '/cliente': (context) => ClienteScreen(),
        '/exterior': (context) => ExteriorScreen(),
        '/interior': (context) => InteriorScreen(),
        '/motor': (context) => MotorScreen(),
        '/fotos': (context) => ReporteFotograficoScreen(),
        '/seleccion': (context) => SelectionScreen(),
        '/fotoScreen': (context) => FotoScreen(),
        '/gps': (context) => GpsScreen(),
        '/inventario': (context) => InventarioScreen(),
        '/btconfig': (context) => BTConfigScreen(),
      },
      home: LoginPage(),
    );
  }
}
