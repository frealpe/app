import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';



class UsersDataSource extends DataTableSource{

  final List<Usuario> users;

  UsersDataSource(this.users);
  @override
  DataRow getRow(int index) {

    final Usuario user = users[index];
    
    final image = (user.img==null)
    ? Image(image: AssetImage('no-image.jpg'),width: 50,height: 500)
    : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!,width: 500,height: 500);

      return DataRow.byIndex(
        index: index,
        cells: [
          DataCell(                     //Imagen
            ClipOval(child: image) 
            
            ),
          DataCell(Text(user.nombre)),  //Referencia
          DataCell(Text(user.correo)),  //Cantidad
          DataCell(Text(user.uid)),     //Largo-Ancho-Alto
                                        //Precio     
          DataCell(                     //Editar
            IconButton(
              onPressed: (){
                //Si coloco el push
                 NavigationServer.replaceTo('/dashboard/users/${user.uid}'); 
              },
              icon: Icon(Icons.edit_outlined)
              )
          ),
        ]
        );
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => this.users.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;

  
}