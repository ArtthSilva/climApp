import 'package:climas_app/model/clima.dart';
import 'package:climas_app/services/climas_api_cliente.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  ClimasApiCliente apiCliente = ClimasApiCliente();

  ValueNotifier<ClimaModel?> clima = ValueNotifier(null);
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<void> searchClima({required String lugar}) async{
    isLoading.value = true;

    ClimaModel? climaModel = await apiCliente.getClima(lugar: lugar);

    if (climaModel != null) {
      clima.value = climaModel;
      isLoading.value = false;
      notifyListeners();
    } else {
      clima.value = null;
      isLoading.value = false;
      notifyListeners();
    }
  } 

  void clear() {
    clima.value = null;
    isLoading.value = false;
    notifyListeners();
  }
} 