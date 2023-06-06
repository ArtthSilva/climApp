import 'package:climas_app/model/clima.dart';
import 'package:flutter/material.dart';

class CardClima extends StatelessWidget {
  const CardClima({super.key, this.clima});
  final ClimaModel? clima;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("nome: ${clima?.name}"),
            Text("temperatura: ${clima?.main['temp']}"),
            Text("clima: ${clima?.weather[0]['main']}"),
            Text("vento: ${clima?.wind['speed']}"),
          ],
        ),
      ),
    );
  }
}