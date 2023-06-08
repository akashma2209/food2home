import 'package:food2home/controllers/popular_product_controller.dart';
import 'package:food2home/data/repository/popular_product_repo.dart';
import 'package:food2home/utils/app_constants.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';

import '../controllers/recommended_product_controller.dart';

import '../data/api/api_client.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init()async {
  //api client
Get.lazyPut(()=>ApiClient(appBaseurl: AppConstants.BASE_URL));
  //repo
Get.lazyPut(() => PopularProductRepo(apiClient:Get.find()));
Get.lazyPut(() => RecommendedProductRepo(apiClient:Get.find()));
//controller
Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
Get.lazyPut(() => RecommendedProductController(recommendedProductRepo:Get.find(), ));
}