import 'package:flutter/material.dart';
import 'package:ticket_bookimg/app/utils/colors.dart';
import 'package:ticket_bookimg/app/utils/textStyles.dart';

class CustomRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final TextStyle? styles1;
  final TextStyle? styles2;

  const CustomRichText({super.key, required this.text1, this.styles1, required this.text2, this.styles2});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: styles1 ?? style(15, FontWeight.w400, AppColors.textColor),
          ),
          TextSpan(
            text: text2,
            style: styles2 ?? style(14, FontWeight.w500, AppColors.grey),
          ),
        ],

      ),
    );
  }
}
