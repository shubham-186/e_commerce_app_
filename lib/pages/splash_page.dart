import 'dart:async';

import 'package:e_commerce_app/app_root/app_Routes.dart';
import 'package:e_commerce_app/ui/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utlils/constants/app_constants.dart';

class SplashPage extends StatefulWidget{
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); //

    Timer(Duration(seconds: 3),()async{
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginPage()),
      // );
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