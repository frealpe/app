
import 'package:flutter/material.dart';

class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();
/////////////////////////////////////////////////////////////////////////////////////////////////////////
  static showSnackbarError (String messages){
    final snackbar = new SnackBar(
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text(messages,style:TextStyle(color: Colors.white,fontSize: 20))
      );
      messengerKey.currentState!.showSnackBar(snackbar);
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////
  static showSnackbar (String messages){
    final snackbar = new SnackBar(      
      content: Text(messages,style:TextStyle(color: Colors.white,fontSize: 20))
      );
      messengerKey.currentState!.showSnackBar(snackbar);
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////
  static showBusyIndicator(BuildContext context){
    final AlertDialog dialog = AlertDialog(
      content: Container(
        width: 100,
        height: 100,
        child: Center(
          child: CircularProgressIndicator()
        ),
      ),
    );
/////////////////////////////////////////////////////////////////////////////////////////////////////////
    showDialog(context: context, builder: (_)=> dialog);
  }
}