

import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  //final authProvider = AuthProvider;

  String email = '';
  String password = '';

 // LoginFormProvider(this.authProvider);
  
  bool validateForm(){
      if (formKey.currentState!.validate()){
        print('Valido');
        print('$email === $password');
//        authProvider.login(email, password);
        return true;

      } else{
        //print('No valido');
        return false;}
      
  }

}