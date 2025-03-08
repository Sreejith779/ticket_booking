import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class ConfirmedTicketView extends StatelessWidget {
  const ConfirmedTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Center(
        child: Text("confirm Ticket"),
      ),
    );
  }
}
