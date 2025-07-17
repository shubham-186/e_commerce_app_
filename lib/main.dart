import 'package:e_commerce_app/const/constants.dart';
import 'package:e_commerce_app/pages/dashboard.dart';
import 'package:e_commerce_app/pages/homepage.dart';
import 'package:e_commerce_app/pages/login_page.dart';
import 'package:e_commerce_app/pages/product_detail_page.dart';
import 'package:e_commerce_app/pages/sign_up_page.dart';
import 'package:e_commerce_app/pages/splash_page.dart';
import 'package:e_commerce_app/pages/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_root/app_Routes.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Const.whiteColor
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: ProductDetailPage(),
      initialRoute: AppRoutes.ROUTE_SPLASH,
      routes: AppRoutes.routes,
    );
  }
}
