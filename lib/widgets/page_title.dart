import 'dart:math';

import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Transform.rotate(
       angle: -pi/5.0,   
      child: SafeArea(
        //bottom: false,
        //top: false,
        child: Container(
        width: 280,
        height: 190,
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
//              Image(image: AssetImage('assets/logo2.jpg'),)
              Text('Marrón Marroquinería',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              SizedBox(height: 10,),
              Text('Contactos: 3128956340',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}