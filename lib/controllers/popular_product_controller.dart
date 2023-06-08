

import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/product_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList =[];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded =false;
  bool get isLodaded=> _isLoaded;

  Future<void> getPopularProductList()async{
    Response response= await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      print("got product");
      _popularProductList=[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
     // print(_popularProductList);
      _isLoaded = true;
      update();
    }
    else{
      print("no product");
    }
  }
}