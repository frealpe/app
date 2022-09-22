
import 'dart:typed_data';

import 'package:admin_dashboard/api/BolsosApi.dart';
import 'package:admin_dashboard/models/producto.dart';
import 'package:flutter/material.dart';

class ProductoFormProvider extends ChangeNotifier {

Producto? producto;
Categoriap? categoria;


late GlobalKey<FormState> formKey; 

/////////////////////////////////////////
 copyCategoriaWith({
    String? id,
    String? nombre,
    })

{ 
  categoria = Categoriap(
  id: id ?? categoria!.id,
  nombre: nombre?? categoria!.nombre,
  );
  } 
/////////////////////////////////////////
copyProductoWith({
    String? id,
    String? nombre,
    String? genero,
    String? cantidad,
    String? usuario,
    String? precio,
    Categoriap? categoria,
    String? descripcion,
    String? disponible,
    String? img,
})
{
    producto = Producto(
      id: id ?? producto!.id,
      nombre: nombre ?? producto!.nombre,
      genero: genero ?? producto!.genero,
      cantidad: cantidad ?? producto!.cantidad,
      usuario: usuario ?? producto!.usuario,
      precio: precio ?? producto!.precio,
      categoria: categoria ?? producto!.categoria,
      descripcion: descripcion ?? producto!.descripcion,
      disponible: disponible ?? producto!.disponible,
      img: img ?? producto!.img,
    );
    notifyListeners();
}
///////////////////////////////////////////////////////////
  bool _validForm() {
    return formKey.currentState!.validate();
  }
///////////////////////////////////////////////////////////
  Future updateProducto() async {

    if ( !this._validForm() ) return false;

    final data = {
      'nombre': producto!.nombre,
      'genero': producto!.genero,
      'precio': producto!.precio,
      'cantidad': producto!.cantidad,
      'categoria': producto!.categoria!.id,  //Se debe actualizar el id de la categoria.
      'descripcion': producto!.descripcion,
      'disponible': producto!.disponible,
    };

    try {
      
      final resp = await BolsosApi.put('/productos/${ producto!.id }', data);
      return true;

    } catch (e) {
      print('error en updateUser: $e');
      return false;
    }

  }

///////////////////////////////////////////////////////////
  Future newProducto() async {
      
    if ( !this._validForm() ) return false;

    final data = {
      'nombre': producto!.nombre,
      'genero': producto!.genero,
      'precio': producto!.precio,
      'cantidad': producto!.cantidad,
      'categoria': producto!.categoria!.id,  //Se debe actualizar el id de la categoria.
      'descripcion': producto!.descripcion,
      'disponible': producto!.disponible,
    };

    try {
      
      final resp = await BolsosApi.post('/productos/', data);    
      return resp;

    } catch (e) {
      print('error en updateUser: $e');
      return false;
    }

  }
///////////////////////////////////////////////////////////

/////////////////////SE CREA LA NUEVA CATEGORIA
  Future newCategoryp( ) async {
    
    if ( !this._validForm() ) return false;

    final data = {
      'nombre': categoria!.nombre,
    };

    try {
      final json = await BolsosApi.post('/categorias', data );
      notifyListeners();
      
    } catch (e) {
      throw 'Error al crear categoria';
    }
  }


///////////////////////////////////////////////////////////
  Future<Producto> uploadImage(String path, Uint8List bytes) async{
    try {
      final resp = await BolsosApi.uploadFile(path, bytes);
      producto = Producto.fromMap(resp);
      notifyListeners();
      return producto!;
    } catch (e) {
      throw 'Error en imagen';
      
    }
    
  }
///////////////////////////////////////////////////////////

}