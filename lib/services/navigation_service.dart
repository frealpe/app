
import 'package:flutter/material.dart';

class NavigationServer{

  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  static navigateTo (String routeName){
    print(navigatorKey.currentState!.pushNamed(routeName));
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  //Se usa para que despues de pasar al dashboard no se pueda volver al login
    static replaceTo (String routeName){
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}