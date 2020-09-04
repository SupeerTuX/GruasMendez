import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardHeader extends StatefulWidget {
  final Function uploadReporte;
  final Function openReporte;
  final Function btConfig;
  final Function printTicket;
  CardHeader(
      {this.uploadReporte, this.openReporte, this.btConfig, this.printTicket});
  @override
  _CardHeaderState createState() => _CardHeaderState();
}

class _CardHeaderState extends State<CardHeader> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.blue,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22,
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Nombre de Usuario',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      HapticFeedback.vibrate();
                      widget.btConfig();
                    },
                    child: IconoHeader(
                        icono: Icons.bluetooth, iconoText: 'Bluetooth')),
                InkWell(
                    onLongPress: () {
                      widget.openReporte();
                    },
                    onTap: () {
                      HapticFeedback.vibrate();
                      widget.uploadReporte();
                    },
                    child: IconoHeader(
                        icono: Icons.cloud, iconoText: 'Subir Reporte')),
                InkWell(
                    onTap: () {
                      HapticFeedback.vibrate();
                      widget.printTicket();
                    },
                    child: IconoHeader(
                        icono: Icons.print, iconoText: 'Imprimir Ticket')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconoHeader extends StatelessWidget {
  final IconData icono;
  final String iconoText;
  const IconoHeader({
    Key key,
    this.icono,
    this.iconoText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          this.icono,
          color: Colors.white,
          size: 40,
        ),
        Text(
          this.iconoText,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
