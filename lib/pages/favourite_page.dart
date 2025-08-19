import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utlils/constants/app_constants.dart';

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Const.whiteColor,
      appBar:  AppBar(
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Const.whiteColor,
        title: Text("WishList",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
        actions: [
          Icon(Icons.favorite,color: Colors.red,),
          SizedBox(width: 6,),
          Icon(Icons.share),
          SizedBox(width: 12,),
        ],
      ),
      body: Center(child: Text("Yet To Work"),),
    );
  }
}