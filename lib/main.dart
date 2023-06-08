import 'package:flutter/material.dart';
import 'package:food2home/controllers/popular_product_controller.dart';
import 'package:food2home/pages/Home/food_page_body.dart';
import 'package:food2home/pages/cart/cart_page.dart';
import 'package:food2home/pages/food/popular_food_detail.dart';
import 'package:food2home/pages/food/recommended_food_detail.dart';
import 'package:food2home/pages/sign_in/Signin_text.dart';
import 'package:food2home/pages/sign_in/signin_page.dart';
import 'package:food2home/routes/route_helper.dart';
import 'package:get/get.dart';
import 'pages/Home/main_food_page.dart';
import 'helper/dependencies.dart' as dep;
 Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home:SignInScreen(),
      //SignInTextFields(),
      //SignInScreen(),
      //initialRoute: RouteHelper.mainFood,
     getPages: RouteHelper.routes,
    );
  }
}

