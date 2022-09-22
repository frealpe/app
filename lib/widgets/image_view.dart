import 'package:admin_dashboard/models/producto.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {

  
final Producto producto;

  ImageView({
    Key? key,    
    required this.producto,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Padding(
        padding: EdgeInsets.symmetric(horizontal:15),        
        child: Container(
        margin: EdgeInsets.only(top:30,bottom:50),
        decoration: _cardBorders(),
        child: Container(
        margin: EdgeInsets.symmetric(horizontal:20,vertical: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: FadeInImage(
                image: NetworkImage('${producto.img}'),
                placeholder: AssetImage('assets/no-image.jpg'),
                fit: BoxFit.cover,
                ),
            ),
       ),
      )

    );
        
  }

  BoxDecoration _cardBorders() => BoxDecoration(
      color: Color.fromARGB(255, 124, 117, 117),
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color:  Color.fromARGB(255, 94, 90, 90),
          offset: Offset(0,8),
          blurRadius: 15
        )
      ]


  );
  
}
