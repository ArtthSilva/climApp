import 'package:climas_app/model/clima.dart';
import 'package:flutter/material.dart';

class CardClima extends StatelessWidget {
  const CardClima({super.key, this.clima});
  final ClimaModel? clima;
  @override
  Widget build(BuildContext context) {
    return  Container(  
       decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          color: Colors.blue,
       ),
      
      height: MediaQuery.sizeOf(context).height * 0.7,
      width: MediaQuery.sizeOf(context).width * 1,
    
        child:
             Column(
               children: [
          Container(
            padding: const  EdgeInsets.only(top: 50, bottom: 20),
            child:  Text("${clima?.name}",style: const TextStyle(fontSize: 35,color: Colors.white),),
          ),
                 Row(
                   
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const Text('temperature',style: TextStyle(fontSize: 25,color: Colors.white),),
                        Text( '${clima?.main['temp']}ºC',style: TextStyle(color: Color.fromARGB(255, 255, 191, 191), fontSize: 23),),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),

                    Column(
                      children: [
                        const Text('climate',style: TextStyle(fontSize: 25,color: Colors.white),),
                       Text('${clima?.weather[0]['main']}',style: TextStyle(color: Color.fromARGB(255, 255, 191, 191), fontSize: 23),),
                      ],
                    ),
                      const SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        const Text('wind',style: TextStyle(fontSize: 25,color: Colors.white),),
                  Text('${clima?.wind['speed']}',style: TextStyle(color: Color.fromARGB(255, 255, 191, 191), fontSize: 23),),
                      ],
                    ), 
            ],
                   ),
               ],
             ),
        
          
        
    );
  }
}