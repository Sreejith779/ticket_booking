import 'package:flutter/material.dart';
import 'package:ticket_bookimg/app/utils/textStyles.dart';

import 'colors.dart';

Widget button(
    {required VoidCallback onPressed,
    required BuildContext context,
    required String title,
    required Color color,
      double? height
    }) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width:  MediaQuery.of(context).size.width,
      height: height??MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          title,
          style: style(18, FontWeight.w600, AppColors.white),
        ),
      ),
    ),
  );
}
