import 'dart:async';

import 'package:e_commerce_app/app_root/app_Routes.dart';
import 'package:e_commerce_app/const/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget{
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); //

    Timer(Duration(seconds: 3),()async{
      Navigator.pushReplacementNamed(context, AppRoutes.LOGIN_PAGE);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/shop_logoo.png",
              width: 250,
              height: 250,
            )
          ],
        ),
      )

    );
  }
}