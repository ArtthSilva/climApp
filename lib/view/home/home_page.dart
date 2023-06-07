import 'package:climas_app/view/components/card_clima.dart';
import 'package:flutter/material.dart';
import 'package:climas_app/controllers/home_controller.dart';

  
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
      body: SingleChildScrollView(
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
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      child: TextFormField(
                        controller: _lugarController,
                        decoration: InputDecoration(
                          label: const Text('inform a place'),
                          suffixIcon: IconButton(
                            onPressed: () {
                              homeController.clear();
                              _lugarController.text = "";
                            },
                            icon: const Icon(Icons.close_outlined),
                          ),
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
                        child: const Text('Consult')),
                    
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.095,
                      ),

                    Visibility(
                        visible: !homeController.isLoading.value &&
                            homeController.clima.value != null,
                        child: CardClima(
                            clima: homeController.clima.value)),
                  ])),
    );
  }
}