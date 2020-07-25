import 'package:flutter/material.dart';

//Widget logo y titulo de la pantalla
class Header extends StatelessWidget {
  final String imageAsset;
  final String titulo;
  final String subtitulo;

  Header({
    this.imageAsset,
    this.titulo,
    this.subtitulo,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  this.imageAsset,
                ),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black45,
                width: 4,
              ),
            ),
          ),
          Text(
            this.titulo,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          Text(
            this.subtitulo,
            style: TextStyle(fontSize: 12, color: Colors.black38),
          ),
        ],
      ),
    );
  }
}
