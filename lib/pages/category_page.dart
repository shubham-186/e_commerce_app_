import 'package:e_commerce_app/data/remote/model/wish_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../utlils/constants/app_constants.dart';

class CategoryPage extends StatelessWidget {
  final itemHeights = [
    200.0,
    250.0,
    250.0,
    180.0,
    300.0,
    150.0,
    220.0,
    170.0,
    170.0,
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Const.whiteColor,
      appBar:  AppBar(
        centerTitle: false,
        foregroundColor: Colors.black,
        backgroundColor: Const.whiteColor,
        title: Text("Category",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
        actions: [
          Icon(Icons.favorite_outline_outlined),
          SizedBox(width: 8,),
          Image.asset("assets/images/cart_wheel.png",
            height: 35,
            width: 35,
          ),
          SizedBox(width: 12,),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Container(
              height: 300, // Set a fixed height for the horizontal ListView
              child: ListView(
                scrollDirection: Axis.horizontal, // Set the scroll direction to horizontal
                children: [
                  SizedBox(width: 10), // Add spacing at the start
                  // First Image and Text
                  Column(
                    children: [
                      Container(
                        width: 180, // Fixed width for each item
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/mens_wear.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Text("Men's"),
                    ],
                  ),
                  SizedBox(width: 10),
                  // Second Image and Text
                  Column(
                    children: [
                      Container(
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/womens_wear.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Text("Women's"),
                    ],
                  ),
                  SizedBox(width: 10),
                  // Third Image and Text (Example)
                  Column(
                    children: [
                      Container(
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/kids_wear.jpg"), // Replace with your image
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Text("Kid's"), // Replace with your text
                    ],
                  ),
                  SizedBox(width: 10),
                  // Fourth Image and Text (Example)
                  Column(
                    children: [
                      Container(
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/foot_wear.jpg"), // Replace with your image
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Text("Footwear"), // Replace with your text
                    ],
                  ),
                  SizedBox(width: 10), // Add spacing at the end
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            child: Text("Trending Collections"),
          ),
          Expanded( // Yahan Expanded lagana zaroori hai
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemCount: WishModel.trending_list.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: itemHeights[index % itemHeights.length],
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                            '${WishModel.trending_list[index]["collections"]}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(''),
                      // child: Text('Item $index',style: TextStyle(color: Colors.white),),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}