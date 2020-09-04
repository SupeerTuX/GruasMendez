import 'package:flutter/material.dart';
import 'package:mrd_interfaz/models/DataModel.dart';

class Info extends StatefulWidget {
  final InfoModel infoModel;

  Info({this.infoModel});
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final TextStyle _style = TextStyle(
      color: Colors.black45, fontSize: 16.0, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.greenAccent[100],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text('Reporte: ${widget.infoModel.reporte}', style: _style),
              Text('Estado: ${widget.infoModel.info}', style: _style),
              Text('Tickets impresos: ${widget.infoModel.tickets}',
                  style: _style),
            ],
          ),
        ),
      ),
    );
  }
}
