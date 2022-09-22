import 'package:admin_dashboard/models/producto.dart';
import 'package:admin_dashboard/widgets/image_view.dart';
import 'package:flutter/material.dart';

class ProductosView extends StatelessWidget {


final Producto producto;

  ProductosView({
    Key? key,    
    required this.producto,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        body: SingleChildScrollView(         
          child:Column(
              children: [
                Stack(
                  children: [
                    ImageView(producto: producto),
            /////////////////////////////////////
             Positioned(
              top: 60,
              left: 30,
              child: IconButton(
                onPressed: ()=> Navigator.of(context).pop(),
                icon: Icon(
                Icons.arrow_back_ios_new,size:40,
                color:  Color.fromARGB(255, 66, 33, 12),
                ) 
                
                )
              ), 


 
                  ],
                ),
                _Informacion(producto: producto),  
                _Precio(producto: producto),    
              ],
          ) 
        ),    

    );
        
  }
  
}
////////////////////////////////////////////////////////////////////////
class _Informacion extends StatelessWidget {

  final Producto producto;
  const _Informacion({
    Key? key, 
    required this.producto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:3,bottom:50,left: 10,right: 10),
      width: double.infinity, 
      height: 180,
      decoration: _buildBoxDecoration(), 
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15), 
      child: Column(
        children:[
        Text(
          'Descripción General del Artículo:',
          style: TextStyle(
          color: Color.fromARGB(255, 17, 17, 17),
                fontSize: 30,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                shadows:[Shadow(color:Color.fromARGB(136, 78, 75, 75), offset:Offset(1,2), blurRadius: 4 ) ]
          )          
          ),
        Text(
          '${producto.descripcion}',
          style: TextStyle(
          color: Color.fromARGB(255, 17, 17, 17),
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                shadows:[Shadow(color:Color.fromARGB(137, 155, 148, 148), offset:Offset(1,2), blurRadius: 4 ) ]
          )          
          ),
        ]
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Color.fromARGB(255, 255, 254, 253),
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color:  Color.fromARGB(255, 139, 112, 112),
          offset: Offset(0,8),
          blurRadius: 15
        )
      ]
    
  );
}
////////////////////////////////////////////////////////////////////////
class _Precio extends StatelessWidget {

  final Producto producto;
  const _Precio({
    Key? key, 
    required this.producto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:5,bottom:50,left: 10,right: 10),
      width: double.infinity, 
      height: 80,
      decoration: _buildBoxDecoration(), 
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15), 
      child: Column(
        children:[

        Text(
          'Precio: \$ ${producto.precio} COP',
          style: TextStyle(
          color: Color.fromARGB(255, 17, 17, 17),
                fontSize: 24,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
                shadows:[Shadow(color:Color.fromARGB(136, 15, 15, 15), offset:Offset(1,2), blurRadius: 4 ) ]
            )          
          ),
        ]
      ),

    );
  }
  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Color.fromARGB(255, 253, 253, 252),
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color:  Color.fromARGB(255, 87, 85, 85),
          offset: Offset(0,8),
          blurRadius: 15
        )
      ]
    
  );
}