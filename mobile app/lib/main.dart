import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/views/bottomNavigation_page/controller/bottom_nav_controller.dart';
import 'app/views/bottomNavigation_page/ui/bottom_navigation_view.dart';
import 'app/views/home_page/controller/home_controller.dart';
import 'app/views/sign_in_page/ui/sign_in_view.dart';

void main() {
  runApp(MultiProvider(
      providers: [
   ChangeNotifierProvider(create: (_)=>BottomNavController()),
   ChangeNotifierProvider(create: (_)=>HomeController()),

  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SignInView(),

      // BottomNavigationView(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }
}
