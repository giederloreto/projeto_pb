import 'package:flutter/material.dart';

class TextoForca extends StatelessWidget {
  final String forca;
  final Color cor;

  TextoForca({required this.forca, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        forca,
        style: TextStyle(color: cor),
      ),
    );
  }
}
