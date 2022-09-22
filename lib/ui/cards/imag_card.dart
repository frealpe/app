import 'package:admin_dashboard/providers/producto_form_provider.dart';
import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////
class ImagenContainer extends StatelessWidget {

  const ImagenContainer({
    super.key, 
  
    });

  @override
  Widget build(BuildContext context) {

    final productoFormProvider = Provider.of<ProductoFormProvider>(context);
    final producto = productoFormProvider.producto;
    
    final image = (producto!.img==null)
    ? Image(image: AssetImage('no-image.jpg'))
    : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: producto.img!);
      
    
    return WhiteCard(

      width: 700,
      height: 900,
      visible: true,
      
      child: Container(        
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Imagen del Articulo', style: CustomLabels.h2),
            SizedBox( height: 20 ),
            Container(
              width: 500,
              height: 800,             
              child: Stack(                
                children: [                 
                  ClipRect(
                    child: image
                  ),

                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all( color: Colors.black, width: 4 )
                      ),


                    child: AnimatedOpacity(
                    opacity: SideMenuProvider.isImag ? 1.0 : 0.0,
                     duration: Duration(milliseconds: 500),
                        child: FloatingActionButton(                      
                          backgroundColor: Color.fromARGB(255, 109, 32, 4),
                          elevation: 0,
                          child: Icon( Icons.camera_alt_outlined, size: 20,),
                          onPressed: () async{
                      
                          FilePickerResult? result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,  
                          allowedExtensions: ['jpg','jpeg','png'],
                          allowMultiple: false
                         );
                         //TODO depender de un estado de otro widget
                            if (result != null) {
                              NotificationsService.showBusyIndicator(context);                            
                              final newProducto = await productoFormProvider.uploadImage('/uploads/productos/${producto.id}',result.files.first.bytes!);
                              Provider.of<ProductosProvider>(context,listen: false).refreshProducto(newProducto);
                              Navigator.of(context).pop();
                            }else {
                              // User canceled the picker
                            }       
                       
                          },
                        ),
                      ),
                    ),
                  )

                ],
              )
            ),

            SizedBox( height: 10 ),

            Text(
              producto.nombre,
              style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20 ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      )
    );
  }

}
/////////////////////////////////////////////////////////////////////////////////////////////////