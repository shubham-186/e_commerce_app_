import 'package:flutter/material.dart';
import '../utlils/constants/app_constants.dart';
import 'homepage.dart'; // Make sure this import is correct

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Const.whiteColor,
        title: Text(
          "WishList",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        actions: [
          Icon(Icons.favorite, color: Colors.red),
          SizedBox(width: 6),
          Icon(Icons.share),
          SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack( // Using Stack to position the icon
          children: [
            Container(
              height: 270,
              width: 170,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.pink),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  SizedBox(height: 38),
                  Container(
                    height: 125,
                    width: 114,
                    // decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: Image.asset(
                      "assets/images/boat_speaker.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      "Boat Speaker",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "₹1500",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        // Note: buildColorDot() function is not provided, so this will cause an error if not defined.
                        Row(
                          children: [
                            buildColorDot(Colors.black),
                            buildColorDot(Colors.red),
                            buildColorDot(Colors.blue),
                            buildColorDot(Colors.green),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, AppRoutes.CART_PAGE);
                    },
                    child: Container(
                      height: 29,
                      width: 115,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned( // Icon positioned at the top-right
              top: -8,
              right: -8,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.cancel,color: Colors.pink,),
              ),
            ),
            Positioned(
              top: 32,
              left: 1,
                child: Container(
                  // width: 140,
                  width: 198,
              height: 1,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey.shade300
                  // color: Colors.black
                )
              ),
            ))
          ],
        ),
      ),
    );
  }
}