import 'package:admin_dashboard/models/producto.dart';

import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductoModal extends StatefulWidget {
  
  final Producto? producto;
  ProductoModal({
    Key? key,
   this.producto
   }) : super(key: key);

  @override
  State<ProductoModal> createState() => _ProductoModalState();
}

class _ProductoModalState extends State<ProductoModal> {

  String nombre='';
  String? id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id= widget.producto?.id;
    nombre= widget.producto?.nombre ?? '';

  }

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductosProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(20),
      height: 500,
      width: 300,           
      decoration: buildDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.producto?.nombre?? 'Nuevo Producto', style: CustomLabels.h1.copyWith(color: Colors.white),),
              IconButton(onPressed: ()=> Navigator.of(context).pop(), icon: Icon(Icons.close,color: Colors.white)),
            ],
          ),
          Divider(color:Colors.white.withOpacity(0.5)),
          SizedBox(height: 20,),
          TextFormField(
            initialValue: widget.producto?.nombre??'',
            onChanged: (value)=> nombre=value,
            decoration: CustomInputs.loginInputDecoration(
              hint: 'Nombre de la Categoría',
              label: 'Categoría',
              icon: Icons.new_releases_outlined,              
              ),
              style: TextStyle(color: Colors.white),
          ),

          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed:() async{
                try{
               
                if(id==null){
                    await productoProvider.newProducto(nombre);
                    NotificationsService.showSnackbar('$nombre Creada');
                }else{
                    await productoProvider.updateProducto(nombre,id!);
                    NotificationsService.showSnackbar('$nombre Actualizada!');
                }
                } 
                catch(e){
                  NotificationsService.showSnackbarError('No se pudo guardar la producto');

                }

                Navigator.of(context).pop();
              },
              text: 'Guardar',
              color: Colors.white,

            ),
          )
        ],
      ),

    );
  }

  BoxDecoration buildDecoration() => BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:  Radius.circular(20)),
    color: Color.fromARGB(255, 78, 29, 1),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
      )
    ]
  );
}