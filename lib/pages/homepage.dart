import 'package:e_commerce_app/app_root/app_Routes.dart';
import 'package:e_commerce_app/const/widget_tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../const/constants.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLiked = true;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Const.whiteColor,
      appBar:  AppBar(
        backgroundColor: Const.whiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.grid_view),
            Icon(Icons.notification_add_outlined)
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              children: [
                SizedBox(width: 10,),
                Expanded(child: CupertinoSearchTextField(
                )),
                SizedBox(width: 2,),
                Image.asset("assets/icons/sort.png",
                  width: 22,
                  height: 22,
                ),
                // SizedBox(width: 5,),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFE6E6), Color(0xFFFFF3E0)], // 🔥 Soft pink to peach
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                // border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(12)
            ),
            height: 190,
            width: 300,
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 285,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 5,
                    itemBuilder: (ctx_, index) {
                      return Container(
                        child: Row(
                          children: [
                            /// 🔹 Text section
                            Container(
                              width: 135,
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Super Sale", style: TextStyle(fontSize: 20)),
                                  Text("Discount", style: TextStyle(fontSize: 21)),
                                  Row(
                                    children: [
                                      Text("up to", style: TextStyle(fontSize: 15)),
                                      SizedBox(width: 5),
                                      Text("50%",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    height: 29,
                                    width: 85,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Center(
                                      child: Text("Shop Now",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            /// 🔹 Image section
                            Container(
                              width: 135,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage("assets/icons/girl.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 19),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 5,
                  effect: WormEffect(
                    dotColor: Colors.grey.shade300,
                    activeDotColor: Colors.black,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          Container(
            height: 80,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 12,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Const.themeColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "S",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height:1), // spacing between circle and text
                      Text(
                        "Shop",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.PRODUCT_DETAILS);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Special For You",style: TextStyle(fontSize: 18, fontFamily: "semiBold"),),
                  Text("See all",style: TextStyle(color: Colors.grey.shade500),)
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: 12,
                  gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 4/6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
              ),
                  itemBuilder: (ctx,index){
                  return GestureDetector(
                    onTap: (){
                      print("$index th product Tapped");
                      Navigator.pushNamed(context, AppRoutes.PRODUCT_DETAILS);
                    },
                    child: Container(
                      // height: 200,
                      // width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1,
                              color: Colors.grey
                          ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row (
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: (){
                                setState(() {
                                  isLiked = !isLiked;
                                  print("isLiked response: $isLiked");
                                });
                              }, icon:
                              Icon(
                                isLiked?Icons.favorite:Icons.favorite_outline_outlined,
                                color: isLiked ? Colors.red:Colors.grey,
                              )
                              ),],
                          ),
                          Container(
                              height: 105,
                              width: 115,
                              // decoration: BoxDecoration(border: Border.all(width: 1)),

                              child:Image.asset("assets/icons/shoes.png",)
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text("Levi's Men Sneaker Shoes",style: TextStyle(
                                fontSize: 11,fontWeight: FontWeight.bold
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Row(
                              children: [
                                Text("\$1200",style: TextStyle(
                                  fontSize: 13,fontWeight: FontWeight.bold,
                                ),),
                                SizedBox(width: 4,),
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
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, AppRoutes.CART_PAGE);
                            },
                            child: Container(
                              height: 29,
                              width: 115,
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text("Add to Cart",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                // return Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     border: Border.all(
                //       width: 1,
                //       color: Colors.pink
                //     )
                //   ),
                // );

              }),
            ),
          )
        ],
      ),
    );
  }
  Widget LikeHeartWidget({required bool isLiked}) {
    return IconButton(onPressed: () {
      isLiked = !isLiked;
    }, icon: Icon(
      isLiked ? Icons.favorite : Icons.favorite_outline_outlined,
      color: isLiked ? Colors.red : Colors.grey,
      size: 30,
    )
    );
  }
}
Widget buildColorDot(Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 2),
    child: Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(width: 0.5, color: Colors.grey),
      ),
    ),
  );
}