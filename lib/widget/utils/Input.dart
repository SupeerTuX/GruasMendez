import 'package:flutter/material.dart';
import 'package:mrd_interfaz/models/Temas.dart';

class InputText extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Function accion;
  final TextInputTheme theme;
  final TextCapitalization capitalization;

  InputText({
    this.hint,
    this.controller,
    this.accion,
    this.theme,
    this.capitalization,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: TextField(
        textCapitalization: capitalization,
        style: TextStyle(color: this.theme.textInputColor),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: this.hint,
          labelStyle: TextStyle(
            color: this.theme.labelColor,
          ),
        ),
        controller: controller,
        onChanged: (value) {
          this.accion();
        },
        onSubmitted: (value) {
          this.accion();
        },
      ),
    );
  }
}
