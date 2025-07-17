import 'dart:async';
import 'package:e_commerce_app/const/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_root/app_Routes.dart';

class WelcomePage extends StatefulWidget{
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),()async{
      Navigator.pushReplacementNamed(context, AppRoutes.DASHBOARD);
    });
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); //
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      body: Stack(
        children: [
          Center(
            child: Image.asset("assets/icons/sale_ic.png",
              width: 400,
              height:400,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 40,
              right: 20,
              child: GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, AppRoutes.DASHBOARD);
                },
                child: Text("Skip >>",
                  style: TextStyle(fontSize: 16,color: Colors.black),
                ),
              ))
        ],
      ),
    );
  }
}