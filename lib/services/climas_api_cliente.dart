import 'dart:convert';

import 'package:climas_app/model/clima.dart';
import 'package:http/http.dart' as http;


class ClimasApiCliente {
    Future<Clima> fetchClima() async {
    final resp = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Brazil&appid=eb4c24df3b5f1e328b247cd8913075c5&units=metric"));

    if (resp.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(resp.body);

      return Clima.fromJson(json);
    } else {
      throw Exception('erro...');
    }
  }
   
}
