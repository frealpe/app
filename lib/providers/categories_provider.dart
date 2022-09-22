import 'package:admin_dashboard/api/BolsosApi.dart';
import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:flutter/material.dart';


class CategoriesProvider extends ChangeNotifier{

late GlobalKey<FormState> formKey; 

List <Categoria>categorias = [];  

  CategoriesProvider()
  {
   getCategories();
  }
///////////////////////////////////////////////////////////////////////////
 Future getCategories() async {

      final resp = await BolsosApi.httpGet('/categorias');
      final categoriesResp = CategoriesResponse.fromMap(resp);
      categorias = [...categoriesResp.categorias];  
      notifyListeners();
      return categorias;
    }

/////////////////////////////////////////////////////////////////////////////
 Future<Categoria>getCategoriesById(String uid) async{

    try {
    final resp= await BolsosApi.httpGet('/categorias/$uid');  
    final prodR= Categoria.fromMap(resp["categoria"]);
    return prodR;
    } catch (e) {
      print(e);
      throw e;     
    }
  }    

/////////////////////SE CREA LA NUEVA CATEGORIA
  Future newCategory( String name ) async {

    final data = {
      'nombre': name,
    };

    try {
      final json = await BolsosApi.post('/categorias', data );
      getCategories();
      
    } catch (e) {
      throw 'Error al crear categoria';
    }
  }

/////////////////////SE ACTUALIZA CATEGORIA
  Future updateCategory( String name, String id ) async {

    final data = {
      'nombre': name,
    };
    try {
     await BolsosApi.put('/categorias/$id', data );
     categorias=categorias.map(
     (category){
      if(category.id !=id) return category;
      category.nombre=name;
      return category;
     } 
     ).toList();

      notifyListeners();
     
    } catch (e) {
      throw 'Error al actualizar la categoria';
    }
  }

/////////////////////SE ELIMINA CATEGORIA
  Future deleteCategory( String id ) async {

    try {
     await BolsosApi.delete('/categorias/$id',{});
     
      categorias.removeWhere((categoria)=>categoria.id==id);

      notifyListeners();
     
    } catch (e) {
      throw 'Error al borrar la categoria';
    }
  }


/////////////////////SE ACTUALIZA CATEGORIA
void refreshCategoria(Categoria newCategoria){

 
  categorias = this.categorias.map(
    (categoria) {
        if(categoria.id == newCategoria.id){
          categoria=newCategoria;
        }
        return categoria;
    }
    ).toList();

  notifyListeners();
  
}

}