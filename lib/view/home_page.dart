
import 'package:flutter/material.dart';
import 'package:climas_app/controllers/home_controller.dart';

import 'card_clima.dart'; 
 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController _lugarController = TextEditingController();
final HomeController homeController = HomeController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Localização"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
              reverse: true,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _lugarController,
                      decoration: InputDecoration(
                        label: const Text('Informe o lugar'),
                        suffixIcon: IconButton(
                          onPressed: () {
                            homeController.clear();
                            _lugarController.text = "";
                          },
                          icon: const Icon(Icons.close_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_lugarController.text.length >= 5) {
                            homeController.searchClima(
                                lugar: _lugarController.text);
                          } else {
                            const snackBar = SnackBar(
                              content: Text('deu ruim'),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: const Text("Consultar")),
                    const SizedBox(
                      height: 30,
                    ),
                    Visibility(
                        visible: !homeController.isLoading.value &&
                            homeController.clima.value != null,
                        child: CardClima(
                            clima: homeController.clima.value)),
                  ]))),
    );
  }
}