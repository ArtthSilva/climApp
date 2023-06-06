 
import 'dart:developer';

import 'package:climas_app/model/clima.dart';
import 'package:dio/dio.dart';



class ClimasApiCliente {
    Future<ClimaModel?> getClima({required String lugar}) async {
     try {
      var response = await  Dio().get("https://api.openweathermap.org/data/2.5/weather?q=$lugar&appid=eb4c24df3b5f1e328b247cd8913075c5&units=metric");
     
     if (response.statusCode == 200) {
       return ClimaModel.fromJson(response.data);
     }
     } catch (e) {
       log(e.toString());
     }

     return null; 
  }
   
}
