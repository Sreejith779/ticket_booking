import 'package:flutter/material.dart';
import 'package:ticket_bookimg/app/utils/buttons.dart';
import 'package:ticket_bookimg/app/utils/consts.dart';
import 'package:ticket_bookimg/app/utils/custom_textFields.dart';
import 'package:ticket_bookimg/app/utils/textStyles.dart';
import 'package:ticket_bookimg/app/views/sign_in_page/ui/sign_in_view.dart';

import '../../utils/colors.dart';
import '../../utils/custom_rich_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
body: Padding(
  padding:   EdgeInsets.symmetric(
      vertical: verticalPadding * 4, horizontal: horizontalPadding * 2
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: height*0.02,
    children: [
      Center(child: Text("Create your Account",
      style: style(24, FontWeight.w600, Colors.black),)),

      CustomTextField(
        isHeading: true,
        headingTitle: "Name",
        hintText: "Enter your name",
      ),
      CustomTextField(
        isHeading: true,
        headingTitle: "Email",
        hintText: "Enter your email",
      ),
      CustomTextField(
        isHeading: true,
        headingTitle: "Password",
        hintText: "Enter your password",
      ),
      CustomTextField(
        isHeading: true,
        headingTitle: "Confirm Password",
        hintText: "Enter your password",
      ),
      button(
          onPressed: (){},
          context: context,
          title: "Create Account",
          color: AppColors.blue),
      Center(
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                SignInView()));
          },
          child: CustomRichText(
            text1: "Have an account?",
            text2: ' Sign In',
            styles2: style(15, FontWeight.w500, AppColors.blue),
          ),
        ),
      ),
    ],
  ),
),
    );
  }
}
