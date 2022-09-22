
class posicion_card {

  int value=0;
  int lvaue= 0;
  int pos=0;  


 resetval(int val) {
      pos=val;
  }


  data (value,lvaue){
      if(value>0){
         pos = value-1;
      } else{
        pos=lvaue-1;
      }

      return pos;

  }

}