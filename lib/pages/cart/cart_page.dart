

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../database/cart_data.dart';
import '../../database/popular_data.dart';
import '../../database/recommended_data.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimesions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../Home/main_food_page.dart';

class CartPage extends StatefulWidget {
  final int index;
  final String page;
  const CartPage({ key,required this.index, required this.page}) : super(key: key);
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartDataBase cd=new CartDataBase();
  PopularDataBase pd=new PopularDataBase();
  RecommendedDataBase rd = new RecommendedDataBase();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20*2,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                onTap:(){
                  setState(() {
                    if(widget.page=="popular")
                      Get.toNamed(RouteHelper.getPopularFood(widget.index));
                    else
                      Get.toNamed(RouteHelper.getRecommendedFood(widget.index));
                  });
                  },
                child: AppIcon(icon: CommunityMaterialIcons.chevron_left,
              iconColor: Colors.white,
              backgroundColor: AppColors.mainColor,
              iconSize: Dimensions.iconSize24,
            ),),
            SizedBox(width: Dimensions.width20*5),
            GestureDetector(
              onTap:(){
                Get.to(()=>MainFoodPage());
              },
              child: AppIcon(icon: CommunityMaterialIcons.home_outline,
              iconColor: Colors.white,
              backgroundColor: AppColors.mainColor,
              iconSize: Dimensions.iconSize24,
            ),
          ),

        ],
      ) ,
    ),
    Positioned(
    top:Dimensions.height20*5,
    left: Dimensions.width20,
    right: Dimensions.width20,
    bottom: 0,
    child: Container(
    margin: EdgeInsets.only(top:Dimensions.height15),
    // color: Colors.red,
    child:MediaQuery.removePadding(
    context:context,
    removeTop: true,
    child:
     ListView.builder(
    itemCount: 16,
    itemBuilder: (_, index) {
      return Container(
          width: double.maxFinite,
          height: 100,
          child: Row(
            children: [
              Container(
                width: Dimensions.height20 * 5,
                height: Dimensions.height20 * 5,
                margin: EdgeInsets.only(bottom: Dimensions.height10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(CartDataBase.img[index]),
                    ),
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white
                ),
              ),


              SizedBox(width: Dimensions.width10,),
              Expanded(child: Container(
                height: Dimensions.height20 * 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BigText(text: CartDataBase.name[index], color: Colors.black45,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(text: "\₹ ${ CartDataBase.price[index]*(CartDataBase.quantity[index])}", color: Colors.redAccent,),
                        Container(
                          padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.width10,right: Dimensions.width10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      cd.setQuantity(false,index);
                                      if(index<6)
                                        setState(()=> pd.setQuantity(false,index));

                                      else
                                        setState(()=> rd.setQuantity(false,index-6));
                                    });


                                  },
                                  child: Icon(CommunityMaterialIcons.minus,color: AppColors.signColor)),
                              SizedBox(width: Dimensions.width10/2,),
                              BigText(  text:CartDataBase.quantity[index ].toString()),
                              SizedBox(width: Dimensions.width10/2,),
                              GestureDetector(
                                  onTap: (){
                                    setState(()=>
                                        cd.setQuantity(true,index));
                                     if(index<6)
                                      setState(()=> pd.setQuantity(true,index));

                                       else
                                      setState(()=> rd.setQuantity(true,index-6));

                                  },
                                  child: Icon(CommunityMaterialIcons.plus,color: AppColors.signColor)),

                            ],
                          ),
                        ),


                      ],
                    ),
                  ],

                ),
              ),
              )
            ],
          )

      );

    }
    ),

    )
    ),
    )]
    ),
    );
  }
}