import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/colors.dart';
import '../../utils/dimesions.dart';
import '../../widgets/app_icon.dart';
import '../Home/main_food_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignInTextFields(),
  ));
}

class SignInTextFields extends StatelessWidget with InputValidationMixin {
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child:Form(
            key: formGlobalKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                  validator: (email) {
                    if (isEmailValid(email!)) {
                      Get.to(()=>MainFoodPage());
                    } else {
                      Get.snackbar("Invalid!", " 'Enter a valid email'", backgroundColor: AppColors.mainColor, colorText: Colors.white,);
                    }
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Password",
                  ),
                ),
                const SizedBox(height: 50),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                     primary: AppColors.mainColor, // foreground
                  ),
                    onPressed: () {
                      color: Colors.white;
                      if (formGlobalKey.currentState!.validate()) {
                        formGlobalKey.currentState!.save();
                        // use the email provided here
                      }
                    }, //child: null,
                       child: Column(
                           children: [AppIcon(iconSize: Dimensions.iconSize24,
                                      iconColor:Colors.white,
                                      backgroundColor:AppColors.mainColor,
                                      icon: CommunityMaterialIcons.arrow_right),]
                                ),


                ),
          ]
            ),
          ),
    );
  }
}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 6;

  bool isEmailValid(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(email);
  }
}