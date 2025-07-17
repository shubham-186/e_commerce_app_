import 'package:flutter/material.dart';

import 'app_root/app_Routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // home: SplashScreen(),
      initialRoute: AppRoutes.ROUTE_SPLASH,
      // routes: AppRoutes.routes,
      routes: AppRoutes.routes,
    );
  }
}

