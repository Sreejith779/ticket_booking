import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ticket_bookimg/app/helper/extentions.dart';
import 'package:ticket_bookimg/app/utils/buttons.dart';
import 'package:ticket_bookimg/app/utils/colors.dart';
import 'package:ticket_bookimg/app/utils/consts.dart';
import 'package:ticket_bookimg/app/utils/custom_rich_text.dart';
import 'package:ticket_bookimg/app/utils/custom_textFields.dart';
import 'package:ticket_bookimg/app/utils/textStyles.dart';
import 'package:ticket_bookimg/app/views/sign_up_page/sign_up_page.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding * 4, horizontal: horizontalPadding * 2),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: height * 0.02,
              children: [
                Center(
                  child: Text(
                    "Welcome",
                    style: style(18, FontWeight.w400, AppColors.textColor),
                  ),
                ),
                Text(
                  "Sign in or create an account?",
                  maxLines: 2,
                  style: style(
                    30,
                    FontWeight.w400,
                    AppColors.textColor,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    subtitle(
                      "Your everyday travel booking is here!",
                    ),
                    subtitle(
                      "Please enter your email address to start",
                    ),
                  ],
                ),
                CustomTextField(
                  isHeading: true,
 headingTitle: "Email",
                  validator: (value) {
                    if (!value!.isValidEmail()) {
                      return "Please enter a valid email address.";
                    }else if(value.isEmpty){
                      return "Please enter a email";
                    }
                    return null;
                  },
                  hintText: "Enter your email",
                ),
                CustomTextField(
                  isHeading: true,
                  headingTitle: "Password",
                  validator: (value) {
                   if(value!.isEmpty){
                      return "Please enter a password.";
                    }
                    return null;
                  },
                  hintText: "Enter your password",
                ),
                button(
                    height: height * 0.07,
                    onPressed: () {
                      log("message");
                      _formKey.currentState!.validate();
                    },
                    context: context,
                    title: "Continue",
                    color: AppColors.blue),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      SignUpPage()));
                    },
                    child: CustomRichText(
                      text1: "Don't have an account?",
                      text2: ' Sign Up',
                      styles2: style(15, FontWeight.w500, AppColors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget subtitle(String title) {
    return Text(
      title,
      style: style(14, FontWeight.w400, AppColors.textColor),
    );
  }
}
