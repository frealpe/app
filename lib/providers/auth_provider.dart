//El provider debe estar de manera globar

import 'package:admin_dashboard/api/BolsosApi.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/cupertino.dart';

enum AuthStatus{

  checking,
  authenticated,
  notauthenticated,
}


class AuthProvider extends ChangeNotifier{

  String? _token;   //Este token debe ser future que vaya al backend verifique el toke y devuelba el estado del usuario
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider(){
    this.isAuthenticated();
  }

  login(String email, String password){

  final data = {
    'correo': email,
    'password':password,
   };

////////////////////////////////////////////////////////
   BolsosApi.post('/auth/login',data).then(
    (json) {
      final authResponse = AuthResponse.fromMap(json);
      this.user =  authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationServer.replaceTo(Flurorouter.dashboardRoute);
      BolsosApi.configureDio();
      notifyListeners();
    }
   ).catchError((e){
     print('error en: $e');
     NotificationsService.showSnackbarError('Usuario/Password no validos');
   });
  
  } 

////////////////////////////////////////////////////////
  register(String email, String password, String nombre){
  final data = {
    'nombre':nombre,
    'correo': email,
    'password':password,
    'rol': "USER_ROLE",    //Modificar lo de rol
   };

   BolsosApi.post('/usuarios',data).then(
    (json) {
      //print(json);
      final authResponse = AuthResponse.fromMap(json);
      this.user =  authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationServer.replaceTo(Flurorouter.dashboardRoute);
      BolsosApi.configureDio();
      notifyListeners();
    }
   ).catchError((e){
     print('error en: $e');
     NotificationsService.showSnackbarError('Usuario/Password no validos');
   });
  }   
/////////////////////////////verifica a
  Future<bool> isAuthenticated() async{
    final token = LocalStorage.prefs.getString('token');

    if( token ==null){
      authStatus=AuthStatus.notauthenticated;
      notifyListeners();
      return false;
    }

    try{ 
      final resp= await BolsosApi.httpGet('/auth');
      final authResponse=  AuthResponse.fromMap(resp);
      //Para no cerrar la sesión
      LocalStorage.prefs.setString('token', authResponse.token);


      this.user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;

    }catch(e){
      authStatus=AuthStatus.notauthenticated;
      notifyListeners();
      return false;
    }

  }

  ////////////////////////////////////////////////
  logout(){
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notauthenticated;
    notifyListeners();
  }


}