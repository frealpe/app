import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/shared/widges/auth_background.dart';
import 'package:admin_dashboard/ui/shared/widges/card_container.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox( height: 350 ),

              CardContainer(
                child: Column(
                  children: [
                    SizedBox( height: 20 ),
                    Text('Login', style: Theme.of(context).textTheme.headline4 ),
                    SizedBox( height: 30 ),   

                    ChangeNotifierProvider(
                      create: ( _ ) => RegisterFormProvider(),
                      child: _RegisterForm(), 
                    )                                                     
                  ],
                )
              ),
            ],
          ),
        )
      )
   );
  }
 
}

////////////////////////////////////////////////////////

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

return Container(
          
          margin: EdgeInsets.only(top: 20),
          //color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            
            child: Form(
             autovalidateMode: AutovalidateMode.always,  // Valida los campos de manera automática
              key: registerFormProvider.formKey,         //Actualiza la llave
              child: Column(
                children: [
                  //email
                  TextFormField(
                    validator:(value){
                      // ignore: prefer_is_empty
                      if( value == null || value.isEmpty )  return 'Nombre no valido';
                      return null;
                    },
                    onChanged:(value) => registerFormProvider.nombre=value,
                    style: TextStyle(color: Colors.white),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese su nombre',
                      label: 'Nombre',
                      icon: Icons.supervised_user_circle_sharp,
                    ),
                  ),

                  TextFormField(
                    validator:(value){
                      if(!EmailValidator.validate(value ?? ''))  return 'Email no valido';
                      return null;
                    },
                    onChanged:(value) => registerFormProvider.email=value,
                    style: TextStyle(color: Colors.white),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese su correo',
                      label: 'Email',
                      icon: Icons.email_outlined,
                    ),
                  ),
                  SizedBox(height: 20),
                  //Contraseña
                  TextFormField(
                    onChanged:(value) => registerFormProvider.password=value,
                    validator:(value){
                      if(value==null || value.isEmpty ) return 'Ingrese su contraseña';
                      if(value.length<6) return 'La contraseña debe tener 6 caracteres';
                      
                      return null;  //Valido
                    },
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: '*********',
                      label: 'Contraseña',
                      icon: Icons.lock_outlined,
                    ),
                  ),

                  SizedBox(height: 20),

                  CustomOutlinedButton(
                    onPressed: () {
                     final validForm = registerFormProvider.validateForm(); 
                     if(!validForm) return;
                     final authProvider = Provider.of<AuthProvider>(context,listen: false);
                     authProvider.register(
                      registerFormProvider.email,
                      registerFormProvider.password,
                      registerFormProvider.nombre
                      );
                    },
                    text: 'Crear Cuenta',
                    //                color:Colors.red,
                    //                isFilled: true,
                  ),

                  SizedBox(height: 20),

                  LinkText(
                      text: 'Ir a login',
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Flurorouter.rootRoute);
                      },
                      setcolor: Colors.blue),
                ],
              ),
            ),

          ),
        );
  }
}





















