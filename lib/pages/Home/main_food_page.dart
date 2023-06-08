import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food2home/utils/colors.dart';
import 'package:food2home/utils/dimesions.dart';
import 'package:food2home/widgets/big_text.dart';
import 'package:food2home/widgets/small_text.dart';
import 'food_page_body.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    //print("Current height is "+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          Container(

            child: Container(
              margin: EdgeInsets.only(top:Dimensions.height45, bottom:Dimensions.height15),
              padding: EdgeInsets.only(left:Dimensions.width20,right:Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text:
                      "India", color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(text: "Gorakhpur",color: Colors.black54),
                          Icon(CommunityMaterialIcons.chevron_down)

                        ],
                      )
                      // These both line define define the color and size of location hearder
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(CommunityMaterialIcons.magnify,color:Colors.black,size:Dimensions.iconSize24),
                      //This line define the symbol of search icon
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                        //It decide the color of search icon.
                      ),
                    ) ,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          )),

        ],
      ),
    );
  }
}
