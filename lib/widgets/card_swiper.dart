import 'package:admin_dashboard/models/producto.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/ui/views/productos_view.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

/////////////////////////////////////////////////////////////////////
class CardSwiper extends StatelessWidget {

  List <Producto> productos;

  //List <Productobus> productos= [];

  CardSwiper({
    Key? key,
    required this.productos
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      
     final value = Provider.of<CounterProvider>(context,);           
     final size = MediaQuery.of(context).size;

      if(productos.length ==0) {
        return Container(
            width: double.infinity,
            height: size.height*0.4,
            child: Center(
              child: CircularProgressIndicator(),
              ),
        );
      }
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),        
        child: Container(

        margin: EdgeInsets.only(top: 1,bottom: 1),
        width:  double.infinity,      
        height: size.height*0.61,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            /////////////////////////////////////            
            _Deslizartarjeta(size: size, productos: productos),

////////////////////////////////////////////////////////                        
             Positioned(
              top: size.height*0.55,
              left: 0,
              child: _productDetails(
                posicion :value.counter,
                productos: productos,
                ),    
              ),          
            /////////////////////////////////////
            Positioned(
              top: -1,
              right: 0,
              child: _PriceTag(
                posicion :value.counter,
                productos: productos,
                )
              ),      
            /////////////////////////////////////
            Positioned(
              top: -1,
              left: 0,
              child: _NotAvalible(
                posicion :value.counter,
                productos: productos,
                )
              )                    
          ],
        ),

        ),    
            
        );
  }

  BoxDecoration _cardBorders() => BoxDecoration(

      color: Color.fromARGB(255, 124, 117, 117),
      borderRadius: BorderRadius.circular(35),
      boxShadow: [
        BoxShadow(
          color:  Color.fromARGB(255, 66, 33, 12),
          offset: Offset(0,8),
          blurRadius: 15
        )
      ]

  );
}
/////////////////////////////////////////////////////////////////////
class _NotAvalible extends StatelessWidget {
   final int posicion;
   final List<Producto> productos;

  const _NotAvalible({
    Key? key, 
    required this.posicion, 
    required this.productos,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final value = Provider.of<CounterProvider>(context);    
    final categoria = productos[value.counter].categoria!.nombre;
    
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 10),
          child: Text(categoria,
                          style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 8,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          shadows:[Shadow(color:Color.fromARGB(136, 15, 15, 15), offset:Offset(1,2), blurRadius: 4 ) ]
                           
                          ),
          )
          ),
      ),
      width:  150,      
      height: 65,
      decoration: BoxDecoration(
        color:  Color.fromARGB(255, 114, 94, 81),
        borderRadius: BorderRadius.only(topLeft:Radius.circular(25),bottomRight: Radius.circular(25) )
      ),

    );  
  }
}
//////////////////////////////////////////////////////////////////////
class _PriceTag extends StatelessWidget {
   final int posicion;
   final List<Producto> productos;
  const _PriceTag({ 
    Key? key, 
    required this.posicion, 
    required this.productos, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CounterProvider>(context);    
    final precio = productos[value.counter].precio;
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 10),
          child: Text(precio,
                          style: TextStyle(
                          color: Color.fromARGB(255, 14, 14, 14),
                          fontSize: 6,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          shadows:[Shadow(color:Color.fromARGB(136, 15, 15, 15), offset:Offset(1,2), blurRadius: 4 ) ]
                           
                          ),
          )
          ),
      ),
      width:  150,      
      height: 65,
      decoration: BoxDecoration(
        color:  Color.fromARGB(255, 165, 129, 107),
        borderRadius: BorderRadius.only(topRight:Radius.circular(25),bottomLeft: Radius.circular(25) )
      ),

    );
  }
}
//////////////////////////////////////////////////////////////////////
class _productDetails extends StatelessWidget {

   final int posicion;
   final List<Producto> productos;
  const _productDetails({
    Key? key, 
    required this.posicion, 
    required this.productos, 
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CounterProvider>(context);    
    final referencia = productos[value.counter].nombre;
    final categorian =  productos[value.counter].categoria!.nombre;

    return Container(
      child: Padding(
        padding: EdgeInsets.only(right: 310),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            width:  150,      
            height: 65,
            decoration: _BuildboxDecoartion(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Text(
                    referencia,
                          style: TextStyle(
                          color: Color.fromARGB(255, 10, 10, 10),
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          shadows:[Shadow(color:Color.fromARGB(135, 54, 39, 39), offset:Offset(1,2), blurRadius: 4 ) ]
                           
                          ),
                    overflow: TextOverflow.ellipsis,
                  ),
               
              ],
            ),
      
        ),
      ),
    );
  }

  BoxDecoration _BuildboxDecoartion() => BoxDecoration(
    color:  Color.fromARGB(255, 158, 135, 121),
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),topRight: Radius.circular(25))
  );
}
///////////////////////////////////////////////////////////////////
class _Deslizartarjeta extends StatelessWidget {

  const _Deslizartarjeta({
    Key? key,
    required this.size,
    required this.productos,
  }) : super(key: key);

  final Size size;
  final List<Producto> productos;

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CounterProvider>(context);    
    //key:
    return Container(
      width:  double.infinity,
      height: size.height*0.45,      
      //decoration: _cardBorders(),
      child: Swiper(
        itemCount: productos.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width*0.7,
        itemHeight: size.height*0.5,
        itemBuilder: (_, int index)
        {                
        final producto = productos[index];
        value.dataNow(index,productos.length);
        return GestureDetector(
            onTap: (){ 
             Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => ProductosView(producto:productos[index])));  
            },

          child: Container(
            child: Card(          
              child: ClipRRect(
                borderRadius:BorderRadius.circular(5),
                child: FadeInImage(          
                  placeholder: AssetImage ('assets/no-image.jpg'),
                  image: NetworkImage(producto.img!),                
                  fit: BoxFit.cover,
                  
                  ),
              ),
              ),
          ),
            );
        },
        ), 
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
      color: Color.fromARGB(255, 196, 191, 191),
      borderRadius: BorderRadius.circular(19),
      boxShadow: [
        BoxShadow(
          color:  Color.fromARGB(255, 110, 98, 98),
          offset: Offset(0,8),
          blurRadius: 15
        )
      ]


  );

}

