import 'package:food2home/pages/Home/main_food_page.dart';
import 'package:food2home/pages/food/popular_food_detail.dart';
import 'package:food2home/pages/food/recommended_food_detail.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../pages/cart/cart_page.dart';

class RouteHelper {
  static const String mainFood ="/main-food";
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";
  static const String cartPage="/cart-food";

  static String  main()=>'$mainFood';
  static String  getPopularFood(index)=>'$popularFood?index=$index';
  static String  getRecommendedFood(index)=>'$recommendedFood?index=$index';
  static String  getCartPage(index,String page)=>'$cartPage?index=$index&page=$page';

  static List<GetPage> routes =[
  GetPage(name: mainFood,page:()=>MainFoodPage()),
    GetPage(name:popularFood,page:(){
      var index = Get.parameters['index'];
      return PopularFooDetail( index:int.parse(index!),);
    },
    transition: Transition.fadeIn
    ),
    GetPage(name:recommendedFood,page:(){
      var index = Get.parameters['index'];
      return RecommendedFoodDetail(index:int.parse(index!),);
    },
        transition: Transition.fadeIn
    ),
    GetPage(name:cartPage,page:(){
      var index = Get.parameters['index'];
      var page = Get.parameters["page"];
      return CartPage(index:int.parse(index!), page: page!,);
    },
        transition: Transition.fadeIn
    ),
  ];
}