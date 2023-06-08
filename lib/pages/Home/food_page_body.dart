import 'package:community_material_icon/community_material_icon.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food2home/controllers/popular_product_controller.dart';
import 'package:food2home/data/repository/recommended_product_repo.dart';
import 'package:food2home/database/recommended_data.dart';
import 'package:food2home/pages/food/popular_food_detail.dart';
import 'package:food2home/routes/route_helper.dart';
import 'package:food2home/utils/colors.dart';
import 'package:food2home/utils/dimesions.dart';
import 'package:food2home/widgets/app_column.dart';
import 'package:food2home/widgets/big_text.dart';
import 'package:food2home/widgets/icon_and_text_widget.dart';
import 'package:food2home/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../database/popular_data.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  //It is helpful in slightly showing of next slider on first slider page
  var _currPageValue = 0.0;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue=pageController.page!;
      });
    });
    @override
    void dispose()
    {
      pageController.dispose();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //silder section
      //GetBuilder<PopularProductController>(builder: (popularProducts){
       //return
         Container(
         //color: Colors.redAccent,
         height: Dimensions.pageView,
           
           child: PageView.builder(
               controller: pageController,
               itemCount: 6,
               //popularProducts.popularProductList.length,
               itemBuilder:( context,position){
                 return _buildPageItem(position);
               }
               ),
         
       ),
      //}),
    //Dot indicator
        //GetBuilder<PopularProductController>(builder:(popularProducts){
          //return
            DotsIndicator(
            dotsCount: 6,
            //popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,

            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        //}),
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: BigText(text: ".",color:Colors.black26),
              ),

            ],
          ),
        ),
        //The above container have text "Popular and all in that line"
      ListView.builder(
             physics:NeverScrollableScrollPhysics() ,
             shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context,  index){
                  return GestureDetector(

                    onTap: ()
                    {
                      Get.toNamed(RouteHelper.getRecommendedFood(index));
                    }, 
                   
                    child: Container(
                      margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom:Dimensions.height10 ),
                      child: Row(
                        children: [
                          // The below container shows image in the row
                          Container(
                            width:Dimensions.ListViewImgSize,
                            height: Dimensions.ListViewImgSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                    image: AssetImage(RecommendedDataBase.img[index])
                                )
                            ),
                          ),

                          Expanded(
                              child:  Container(
                                height: Dimensions.ListViewTextCountSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(Dimensions.radius20),
                                    bottomRight: Radius.circular(Dimensions.radius20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: Dimensions.width10/1.9,right: Dimensions.width10/1.9),
                                  child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(text:RecommendedDataBase.name[index]),
                                      SizedBox(height: Dimensions.height10,),
                                      SmallText(text: "Fresh and organic Direct from farmer house"),
                                      SizedBox(height: Dimensions.height10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconAndTextWidget(icon: CommunityMaterialIcons.circle,
                                              text: RecommendedDataBase.review[index],
                                              iconColor: AppColors.iconColor1),

                                          IconAndTextWidget(icon: CommunityMaterialIcons.map_marker,
                                              text: RecommendedDataBase.distance[index],
                                              iconColor: AppColors.mainColor),

                                          IconAndTextWidget(icon: CommunityMaterialIcons.clock_time_four_outline,
                                              text: RecommendedDataBase.time[index],
                                              iconColor: AppColors.iconColor2)

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),

                          ),

                        ],
                      ),
                    ),
                  );
                })
      ],
    );
  }
  Widget _buildPageItem(int index){

    return Stack(
        children: [
          GestureDetector(
            onTap: ()
            {

              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
                height: Dimensions.pageViewContainer,
                margin: EdgeInsets.only(left:Dimensions.width10 , right: Dimensions.width10 ),
                //It create the space between slider image.
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(PopularDataBase.img[index])
                    )
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30,bottom: Dimensions.height30),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                    offset: Offset(0,5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5,0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5,0)
                  )
                  //Boxshadow help to create shadow of the  the small box contaning detail.
                ]

              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15,left: 15,right: 15) ,
                child: AppColumn(text:PopularDataBase.name[index],index: index),

              ),


            ),
          )
        ],
      );
  }
}
