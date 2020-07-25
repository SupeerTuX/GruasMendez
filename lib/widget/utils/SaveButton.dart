import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Widget boton para guardar o validar
class SaveButton extends StatelessWidget {
  final Color color;

  SaveButton({this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0.0),
      child: OutlineButton(
        borderSide: BorderSide(color: this.color, width: 2.0),
        child: Text(
          'Guardar Informacion',
          style: TextStyle(fontSize: 18, color: this.color),
        ),
        onPressed: () {
          HapticFeedback.vibrate();
        },
      ),
    );
  }
}
