import 'package:e_commerce_app/ui/dashboard/dashboard.dart';
import 'package:e_commerce_app/ui/login/login_page.dart';
import 'package:e_commerce_app/pages/product_detail_page.dart';
import 'package:e_commerce_app/pages/splash_page.dart';
import 'package:e_commerce_app/pages/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import '../pages/cart_page.dart';
import '../pages/category_page.dart';
import '../pages/favourite_page.dart';
import '../pages/profile_page.dart';
import '../ui/sign_up/sign_up_page.dart';
class AppRoutes{

  static const String ROUTE_SPLASH = "/";
  static const String DASHBOARD = "home";
  static const String SIGN_UP = "sign_up";
  static const String LOGIN_PAGE = "login";
  static const String WELCOME_PAGE = "welcome_page";
  static const String CATEGORY_PAGE = "category_page";
  static const String FAOURITE_PAGE = "favourite_page";
  static const String CART_PAGE = "cart_page";
  static const String PROFILE_PAGE = "profile_page";
  static const String PRODUCT_DETAILS = "product_detail_page";

 static Map<String,Widget Function(BuildContext) > routes = {
   ROUTE_SPLASH : (_) => SplashPage(),
   DASHBOARD : (_) => Dashboard(),
   SIGN_UP : (_) => SignUpPage(),
   LOGIN_PAGE : (_) => LoginPage(),
   WELCOME_PAGE : (_) => WelcomePage(),
   CATEGORY_PAGE : (_) => CategoryPage(),
   FAOURITE_PAGE : (_) => FavouritePage(),
   CART_PAGE : (_) => CartPage(),
   PROFILE_PAGE : (_) => ProfilePage(),
   PRODUCT_DETAILS : (_) => ProductDetailPage(),
  };
  }