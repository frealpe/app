import 'dart:typed_data';
import 'package:admin_dashboard/api/BolsosApi.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:flutter/material.dart';

class CategoriaFormProvider extends ChangeNotifier {


Categoria? categoria; 

List <Categoria>categorias = [];  

late GlobalKey<FormState> formKey; 

/////////////////////////////////////////
 copyCategoriaWith({
    String? id,
    String? nombre,
    String? img,
    })

{ 
  categoria = Categoria(
  id: id ?? categoria!.id,
  nombre: nombre?? categoria!.nombre,
  img: img ?? categoria!.img,
  );
      notifyListeners();
  } 
///////////////////////////////////////////////////////////
  bool _validForm() {
    return formKey.currentState!.validate();
  }
/////////////////////SE CREA LA NUEVA CATEGORIA
  Future newCategoryp() async {

    if ( !this._validForm() ) return false;

    final data = {
      'nombre': categoria!.nombre,
    };
    try {
      final resp = await BolsosApi.post('/categorias', data );
      return resp;
    } catch (e) {
      throw 'Error al crear categoria';
    }
  }


///////////////////////////////////////////////////////////
  Future<Categoria> uploadImage(String path, Uint8List bytes) async{
    try {
      final resp = await BolsosApi.uploadFile(path, bytes);
      categoria = Categoria.fromMap(resp);
   //   getCategories();
      notifyListeners();
      return categoria!;
    } catch (e) {
      throw 'Error en imagen';
      
    }
    
  }
///////////////////////////////////////////////////////////

}