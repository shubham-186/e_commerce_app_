import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utlils/constants/app_constants.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Const.whiteColor,
      appBar:  AppBar(
        foregroundColor: Const.whiteColor,
      backgroundColor: Const.themeColor,
      title: Text("Profile Page"),
      ),
    );
  }
}