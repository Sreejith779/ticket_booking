import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/assets.dart';
import '../../../utils/colors.dart';
import '../../confirmed_ticket_page/ui/confirmed_ticket_view.dart';
import '../../home_page/ui/home_view.dart';
import '../../notification_page/ui/notification_view.dart';
import '../../profile_page/ui/profile_page_view.dart';
import '../controller/bottom_nav_controller.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BottomNavController>(context);
    final List pages = [
      HomeView(),
      ConfirmedTicketView(),
      NotificationView(),
      ProfilePageView()
    ];
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: Consumer<BottomNavController>(
        builder: (BuildContext context, value, Widget? child) {
          final int selectedIndex = value.selectedIndex;
          return Theme(
            data: Theme.of(context).copyWith(
                splashFactory: NoSplash.splashFactory,
                highlightColor: Colors.transparent),
            child: BottomNavigationBar(
                onTap: (val) {
                  value.isSelectedIndex(val);
                  log("index: ${value.selectedIndex}");
                },
                useLegacyColorScheme: false,
                elevation: 5,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                selectedFontSize: 18,
                unselectedFontSize: 18,
                iconSize: 20,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                currentIndex: value.selectedIndex,
                backgroundColor: AppColors.white,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppAssets.home,
                      height: 18,
                      width: 18,
                      color: selectedIndex == 0
                          ? Colors.black
                          : Colors.grey.shade400,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppAssets.ticket,
                      height: 18,
                      width: 18,
                      color: selectedIndex == 1
                          ? Colors.black
                          : Colors.grey.shade400,
                    ),
                    label: "confirmTicket",
                  ),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        AppAssets.notification,
                        height: 18,
                        width: 18,
                        color: selectedIndex == 2
                            ? Colors.black
                            : Colors.grey.shade400,
                      ),
                      label: "notification"),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        AppAssets.profile,
                        height: 18,
                        width: 18,
                        color: selectedIndex == 3
                            ? Colors.black
                            : Colors.grey.shade400,
                      ),
                      label: "Profile"),
                ]),
          );
        },
      ),
      body: pages[controller.selectedIndex],
    );
  }
}
