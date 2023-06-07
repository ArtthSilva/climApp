 
import 'dart:developer';

import 'package:climas_app/model/clima.dart';
import 'package:dio/dio.dart';
import 'package:climas_app/constants/api_constants.dart';



class ClimasApiCliente {
    Future<ClimaModel?> getClima({required String lugar}) async {
     try {
      var response = await  Dio().get(ApiConstants.urlBase(lugar));
     
     if (response.statusCode == 200) {
       return ClimaModel.fromJson(response.data);
     }
     } catch (e) {
       log(e.toString());
     }

     return null; 
  }
   
}
