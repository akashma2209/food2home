//import 'dart:html';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food2home/utils/colors.dart';
import 'package:food2home/utils/colors.dart';
import 'package:food2home/widgets/app_icon.dart';
import 'package:food2home/widgets/big_text.dart';
import 'package:food2home/widgets/exandable_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../database/cart_data.dart';
import '../../database/recommended_data.dart';
import '../../routes/route_helper.dart';
import '../../utils/dimesions.dart';
import '../cart/cart_page.dart';

class RecommendedFoodDetail extends StatefulWidget {
  final int index;
  const RecommendedFoodDetail({Key? key, required this.index}) : super(key: key);

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  RecommendedDataBase rd = new RecommendedDataBase();
  CartDataBase cd = CartDataBase();
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                onTap: ()
                   {
                  Get.toNamed(RouteHelper.mainFood);
                   },
                  child: AppIcon(icon: CommunityMaterialIcons.close),
                ),

                GestureDetector(
                    onTap:(){
                      Get.toNamed(RouteHelper.getCartPage(widget.index, "recommended"));
                    },
                    child: AppIcon(icon: CommunityMaterialIcons.cart_outline)),
              ],
            ),

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child:
              //itemBuilder: (context, index){
               // return child:
              Container(
                child: Center(child: BigText(size:Dimensions.font26 ,text: RecommendedDataBase.name[widget.index])),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5,bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(Dimensions.radius20),
                  topRight:Radius.circular(Dimensions.radius20),
                  )
                ),
              ),
            // },
            ),
            pinned: true,
            backgroundColor: Colors.green,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(RecommendedDataBase.img[widget.index],
              width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: RecommendedDataBase.description[widget.index]),
                  margin:EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20) ,
                )
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: Dimensions.width20*2.50,right: Dimensions.width20*2.50,
            top: Dimensions.height10,bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (){
                      setState(()=>
                          rd.setQuantity(false,widget.index));

                    },
                    child:  AppIcon(iconSize: Dimensions.iconSize24,
                        iconColor:Colors.white,
                        backgroundColor:AppColors.mainColor,
                        icon: CommunityMaterialIcons.minus)),

                BigText(text: "\₹ ${RecommendedDataBase.price[widget.index]}  "+" X "+RecommendedDataBase.quantity[widget.index].toString(),color: AppColors.mainBlackColor,size: Dimensions.font26,),
                GestureDetector(
                    onTap: (){
                      setState(()=>
                          rd.setQuantity(true,widget.index));

                    },
                    child:  AppIcon(iconSize: Dimensions.iconSize24,
                    iconColor:Colors.white,
                    backgroundColor:AppColors.mainColor,
                    icon: CommunityMaterialIcons.plus)),
              ],
            ),
          ),
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
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Icon(CommunityMaterialIcons.heart,color: AppColors.mainColor,),
                ),
                Container(
                  padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
                  child: GestureDetector(
                      onTap: (){
                        setState(()=>
                            cd.setQuantity1(true,RecommendedDataBase.quantity[widget.index],widget.index+6));

                      },
                      child: BigText(text: "\₹ ${RecommendedDataBase.price[widget.index]*(RecommendedDataBase.quantity[widget.index])} |Add to cart", color: Colors.white,)),
                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  )

                  ,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
