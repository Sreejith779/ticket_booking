import 'package:flutter/material.dart';
import 'package:ticket_bookimg/app/utils/textStyles.dart';

import 'colors.dart';

class CustomTextField extends StatelessWidget {
  final Color? titleColor;
  final bool? isHeading;
  final String? hintText;
  final String? headingTitle;
  final String? Function(String?)? validator;
  const CustomTextField(
      {super.key,
      this.hintText,
      this.validator,
      this.isHeading,
      this.titleColor, this.headingTitle});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isHeading == true
            ? Text(
          headingTitle??"Title",
                style: style(16, FontWeight.w500, titleColor ?? Colors.black),
              )
            : SizedBox.shrink(),
        isHeading == true
            ? SizedBox(
                height: height * 0.01,
              )
            : SizedBox.shrink(),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: style(16, FontWeight.w400, AppColors.grey),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textColor),
                  borderRadius: BorderRadius.circular(10))),
        ),
      ],
    );
  }
}
