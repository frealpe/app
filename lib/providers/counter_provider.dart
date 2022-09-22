
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{ 

///////////////////////////////////////////////////////////////
  int _value = 0;

  get counter => this._value;

  //set initval => this._initvalue;
///////////////////////////////////////////////////////////////
  void dataNow(index,lvaue){  

      if(index>0){
         this._value = index-1;
      } else{
        this._value= lvaue-1;
      }
    WidgetsBinding.instance.addPostFrameCallback((_)
     {
        notifyListeners();
     }
    );    
  }
//////////////////////////////////////////////////////////////
}