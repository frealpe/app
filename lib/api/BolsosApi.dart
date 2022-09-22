
import 'dart:typed_data';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class BolsosApi{

  static Dio dio =  Dio();


  static var baseUrlu=  'https://backend-marron.herokuapp.com/api';

  //static var baseUrlu=  'http://localhost:8080/api';
  
  static void configureDio(){

   
    dio.options.baseUrl= 'https://backend-marron.herokuapp.com/api';
    //    dio.options.baseUrl= 'http://localhost:8080/api';


    //Configurar Headers

    dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''

    };
  }

///////////////////////////////////////////////////////////////
  static Future httpGet(String path)async {
    try{
      final resp= await dio.get('$baseUrlu$path');
      return resp.data;
    } on DioError catch(e){
      throw ('Error en el Get');
    }
  }
///////////////////////////////////////////////////////////////
  static Future post(String path,Map<String,dynamic>data ) async{
//    final formData = FormData.fromMap(data);
     try{
      final resp= await dio.post('$baseUrlu$path',data: data);
      return resp.data;

    } on DioError catch(e){
      print(e);
      throw ('Error en el Post');
    }
  }


///////////////////////////////////////////////////////////////
  static Future put(String path,Map<String,dynamic>data ) async{

    final formData = FormData.fromMap(data);
    try{
      final resp= await dio.put('$baseUrlu$path',data: formData);
      return resp.data;

    } on DioError catch(e){
      print('e');
      throw ('Error en el PUT');
    }
  }
///////////////////////////////////////////////////////////////
  static Future delete(String path,Map<String,dynamic>data ) async{

     final formData = FormData.fromMap(data);
 /*   var formData = FormData.fromMap({
      'data': json.encode(
      {'correo': 'f@gmail.com', 'password': '123456'})
            }); */

    try{
      final resp= await dio.delete('$baseUrlu$path',data: formData);
      print(resp);
      return resp.data;

    } on DioError catch(e){
      print('e');
      throw ('Error en el Delete');
    }
  }
///////////////////////////////////////////////////////////////
  static Future uploadFile(String path,Uint8List bytes ) async{

    final formData = FormData.fromMap({
      'archivo': MultipartFile.fromBytes(bytes)
    });

    try{
      final resp= await dio.put('$baseUrlu$path',data: formData);
      return resp.data;

    } on DioError catch(e){
      print('e');
      throw ('Error en el PUT');
    }
  }

}