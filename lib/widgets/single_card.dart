import 'package:admin_dashboard/router/router.dart';
import 'package:flutter/material.dart';

class SingleCard extends StatelessWidget {

  final String? imagen;

  const SingleCard({
    Key? key,
    this.imagen
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 254,
      decoration: BoxDecoration(
        color: Color.fromARGB(173, 149, 96, 4),
        borderRadius: BorderRadius.circular(20)
      ),
      child: 
      GestureDetector
      (
        //TODO NAVEGAR A LOS PRODUCTOS POR ID COMO EN EL ADMINISTRADOR Y SE DEBE PASAR EL ID
        onTap: () =>  Navigator.pushReplacementNamed(context, Flurorouter.dashboardRoute),
        child: Card(
            
            child: Image(image: AssetImage('assets/${imagen}.jpeg'),          
            fit: BoxFit.cover,           
            ),
      
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.all(10),        
        ),
      ),
    );
  }
} 
