import 'package:admin_dashboard/ui/shared/widges/auth_background.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {


  final Widget child;

  const AuthLayout({
    Key? key,
    required this.child
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Scrollbar(        
        child: AuthBackground(child: child),
      )
    );
  }
}
///////////////////////////////////////////////////////////////


//Cuerpo del Mensajes