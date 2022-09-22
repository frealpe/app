import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
////////////////////////////////////////////////////////////////////////
class ImagenContainerC extends StatelessWidget {

  const ImagenContainerC({
    super.key, 
  
    });

  @override
  Widget build(BuildContext context) {

    final categoriaFormProvider = Provider.of<CategoriaFormProvider>(context);
    final categoria = categoriaFormProvider.categoria;
   
    final image = (categoria!.img==null)
    ? Image(image: AssetImage('no-image.jpg'))
    : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: categoria.img!);
      
    
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
                              final newCategoria = await categoriaFormProvider.uploadImage('/uploads/categorias/${categoria.id}',result.files.first.bytes!);
                              print(newCategoria);
                              Provider.of<CategoriesProvider>(context,listen: false).refreshCategoria(newCategoria);
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
              categoria.nombre,
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