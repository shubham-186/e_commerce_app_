import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/constants.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Const.whiteColor,
      appBar:  AppBar(
        foregroundColor: Const.whiteColor,
        backgroundColor: Const.themeColor,
        title: Text("Category Page"),
      ),
    );
  }
}