import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';
import '../../utils/dimesions.dart';
import 'Signin_text.dart';
import 'button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BackgroundImage(),
        Image(
        height: Dimensions.screenHeight * 0.35,
          fit: BoxFit.cover,
          image: AssetImage("assets/image/realfruits.png"),
        ),
            Center(
              child: Text(
                'Farm 2 Home',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SignInTextFields(),
            SignInButtons(),
          ],
        ),
      ),
    );
  }
}
