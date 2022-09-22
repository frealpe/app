import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {

    final boxDecoration = BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2,0.8],
          colors:[
            Color(0xff441c04),
            Color(0xff6c3404),
          ]
         )
       );
  @override
  Widget build(BuildContext context) {
    //////////////////////////////////////////////
    return Stack(
      children: [
        Container(decoration: boxDecoration),
        Positioned(
          top:-100,
          left: -30,
          child:_cajaCafe() 
          )
        

      ],
    );
  }
}
///////////////////////////////////////////////////////////////////////////
///
class _cajaCafe extends StatelessWidget {

  
  const _cajaCafe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi/5.0,
      child: Container(
        width: 360,
        height: 257,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          gradient: LinearGradient(
            colors: [
             Color.fromARGB(252, 88, 29, 4),
             Color.fromARGB(251, 124, 41, 6),
                         //Color.fromARGB(255, 116, 56, 3),
            ]
            )
            
        ),
       // child: Image(image: AssetImage('assets/logo2.jpg'),),
       //child: Text('Contactos:3113449655'),
      ),
    );
  }
}