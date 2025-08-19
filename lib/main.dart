import 'package:e_commerce_app/data/remote/helper/api_helper.dart';
import 'package:e_commerce_app/data/remote/model/product_model.dart';
import 'package:e_commerce_app/data/remote/repository/cart_repository.dart';
import 'package:e_commerce_app/data/remote/repository/product_repo.dart';
import 'package:e_commerce_app/data/remote/repository/user_repo.dart';
import 'package:e_commerce_app/pages/splash_page.dart';
import 'package:e_commerce_app/ui/my_cart/bloc/cart_bloc.dart';
import 'package:e_commerce_app/ui/product_detail/bloc/product_bloc.dart';
import 'package:e_commerce_app/ui/sign_up/bloc/user_bloc.dart';
import 'package:e_commerce_app/utlils/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_root/app_Routes.dart';

void main(){
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context){
      return UserBloc(userRepo: UserRepository(apiHelper: ApiHelper()));}),
    BlocProvider(create: (context){
     return ProductBloc(apiHelper: ApiHelper());
    }),
    BlocProvider(create: (context){
      return CartBloc(cartRepo: CartRepository(apiHelper: ApiHelper()));}),
  ],
      child: MyApp()));
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
      // home: SplashPage(),
      initialRoute: AppRoutes.ROUTE_SPLASH,
      routes: AppRoutes.routes,
    );
  }
}
