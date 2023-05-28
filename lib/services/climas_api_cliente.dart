import 'dart:convert';

import 'package:climas_app/model/clima.dart';
import 'package:http/http.dart' as http;


class ClimasApiCliente {
  Future<Clima>? getCurrentClima( ) async {
    final resp =  await http.get(
      Uri.parse("API_KEY"));

      if (resp.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(resp.body);

        return Clima.fromJson(json);
      } else {
        throw Exception('erro'); 
      }
  }
  late Future<Clima> meuClima;
}
