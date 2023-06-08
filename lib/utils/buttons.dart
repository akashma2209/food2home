

import 'package:food2home/database/popular_data.dart';
import 'package:get/get.dart';


class buttons extends GetxController{

  int get  quantiy => a;
  int a = 0;
  void setQuantity(bool isIncrement,int index){
    //print("inc"+quantity[index].toString());
    if(isIncrement) {
        a = PopularDataBase.quantity[index]++;
    }
    else
    {
      a = PopularDataBase.quantity[index]--;
    }
   update();
  }
}