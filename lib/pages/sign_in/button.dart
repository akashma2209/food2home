

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food2home/pages/Home/main_food_page.dart';
import 'package:food2home/utils/dimesions.dart';

import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';

class SignInButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            InkWell(
              onTap: () {},
              child: Text('Forget Password?'),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
