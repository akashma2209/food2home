import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food2home/controllers/popular_product_controller.dart';
import 'package:food2home/pages/Home/main_food_page.dart';
import 'package:food2home/pages/cart/cart_page.dart';
import 'package:food2home/routes/route_helper.dart';
import 'package:food2home/utils/buttons.dart';
import 'package:food2home/utils/dimesions.dart';
import 'package:food2home/widgets/app_column.dart';
import 'package:food2home/widgets/app_icon.dart';
import 'package:food2home/widgets/exandable_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../database/cart_data.dart';
import '../../database/popular_data.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFooDetail extends StatefulWidget {
  final int index;
  const PopularFooDetail( {Key? key,required this.index,  }) : super(key: key);

  @override
  State<PopularFooDetail> createState() => _PopularFooDetailState();
}

class _PopularFooDetailState extends State<PopularFooDetail> {
  PopularDataBase pd=new PopularDataBase();
  CartDataBase cb = CartDataBase();
  @override
  Widget build(BuildContext context) {
    //print("Current height is "+MediaQuery.of(context).size.height.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(PopularDataBase.img[widget.index])
                )
              ),
            ),
          ),
          //icon widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 GestureDetector(
                   onTap:(){
                     Get.to(()=>MainFoodPage());
                     },
                     child: AppIcon(icon: CommunityMaterialIcons.chevron_left)),
                  GestureDetector(
                      onTap:(){
                        Get.toNamed(RouteHelper.getCartPage(widget.index, "popular"));
                      },
                      child: AppIcon(icon: CommunityMaterialIcons.cart_outline)),
                  
                ],
          )),
          //introduction of food
          Positioned(
            left: 0,
              right: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),


                child:  Container(
                  width: MediaQuery.of(context).size.width,
                  height:Dimensions.screenHeight/2.15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text:PopularDataBase.name[widget.index],index: widget.index),
                      SizedBox(height: Dimensions.height20,),
                      BigText(text: "Introduce"),
                      //expandable text widget
                      SizedBox(height: Dimensions.height20,),
                      Expanded(
                          child:SingleChildScrollView(
                              child:ExpandableTextWidget(text:PopularDataBase.description[widget.index])
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),

      //bottomNavigationBar
      bottomNavigationBar:
       Container(
         height: Dimensions.bottomHeightBar,
         padding: EdgeInsets.only(top: Dimensions.height30,bottom:Dimensions.height30, left: Dimensions.width20,right: Dimensions.width20),
         decoration: BoxDecoration(
             color:AppColors.buttonBackgroundColor,
             borderRadius: BorderRadius.only(
               topLeft: Radius.circular(Dimensions.radius20*2),
               topRight: Radius.circular(Dimensions.radius20*2),
             )
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height20,left: Dimensions.width10/2,right: Dimensions.width20),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(Dimensions.radius20),
                 color: Colors.white,
               ),
               child: Row(
                 children: [
                   GestureDetector(
                       onTap: (){
                         setState(() {
                           pd.setQuantity(false,widget.index);
                         });


                       },
                       child: Icon(CommunityMaterialIcons.minus,color: AppColors.signColor)),
                   SizedBox(width: Dimensions.width10/2.5,),
                   BigText(  text:PopularDataBase.quantity[widget.index].toString()),
                   BigText(  text:" X \₹${PopularDataBase.price[widget.index].toString()}"),
                   SizedBox(width: Dimensions.width10/2.5,),
                   GestureDetector(
                       onTap: (){
                         setState(()=>
                            pd.setQuantity(true,widget.index));

                       },
                       child: Icon(CommunityMaterialIcons.plus,color: AppColors.signColor)),
                 ],
               ),
             ),
             Container(
               padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width10/2.5,right: Dimensions.width10/2.5),
               child: GestureDetector(
                      onTap: (){
                     setState(()=>
                         cb.setQuantity1(true,PopularDataBase.quantity[widget.index],widget.index));
                        },
                   child: BigText(text: "\₹ ${PopularDataBase.price[widget.index]*(PopularDataBase.quantity[widget.index])} |Add to cart", color: Colors.white,)),
               decoration: BoxDecoration(
                 borderRadius:  BorderRadius.circular(Dimensions.radius20),
                 color: AppColors.mainColor,
               ),
             ),
           ],
         ),
       ),

    );
  }
}
