import 'package:e_commerce_app/app_root/app_Routes.dart';
import 'package:e_commerce_app/const/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPage extends StatefulWidget{
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_new)),
            Row(
              children: [
                Image.asset("assets/icons/share.png",
                  width: 20,
                  height: 20,
                ),
                SizedBox(width: 10,),
                IconButton(onPressed: (){
                  Navigator.pushNamed(context, AppRoutes.CART_PAGE);
                }, icon: Icon(Icons.favorite_border))
              ],
            )
          ],
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 135,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage("assets/icons/shoes.png"),
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
          SizedBox(height: 10,),
          Container(
            // alignment: Alignment.topLeft,
            height: 70,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Levi's Men Sneaker Shoes",style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20
                ),),
                Text("\$1036",style: TextStyle(fontSize:22),)
                // Text("Pearl White for Men"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Seller:",style: TextStyle(fontSize: 17),),
              SizedBox(width: 7,),
              Text("Ashish Sharma",style: TextStyle(fontSize: 14,fontFamily: "semiBold"),),
              SizedBox(width: 11,)
            ],
          ),
          Row(
            children: [
              Container(
                height: 22,
                width: 45,
                decoration: BoxDecoration(
                    color: Const.themeColor,
                    // border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/icons/star.png",width: 10,height: 10,color: Colors.white,),
                    // SizedBox(width: 5,),
                    Text("4.8",style: TextStyle(fontSize: 10,color: Colors.white),)
                  ],
                ),
              ),
              SizedBox(width: 5,),
              Text("\(324 Review\)",style: TextStyle(color: Colors.grey.shade500,fontSize: 11),)
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [Text("Color",style: TextStyle(fontFamily: "semiBold",fontSize: 16),)],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                height: 30,
                width: 194,
                  decoration: BoxDecoration(
                    // border: Border.all(width: 1)
                  ),
                  child: ListView.builder(
                      itemCount: Const.mColors.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: getColorToneWidget(Const.mColors[index]),
                        );
                      }),
                ),
            ],
          ),
          SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Description",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
              Text("Specification",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
              Text("Reviews",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height: 10,),
          Column(
            children: [
              Text(Const.shoesDesc,
                style: TextStyle(fontSize: 12,fontWeight: FontWeight.w200,),
                maxLines: null,            // 🔸 Unlimited lines allowed
                softWrap: true,            // 🔸 Text wrapping allowed
                overflow: TextOverflow.visible,  // 🔸 Overflow ko chhupane ke bajaye dikhaye
              ),

            ],
          ),
            SizedBox(height: 10,),
            Container(
              height: 78,
              width: double.infinity,
              decoration:BoxDecoration(
                color: Colors.black,
                  borderRadius: BorderRadius.circular(46),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Container(
                        width: 115,
                        height: 38,
                        decoration: BoxDecoration(
                            color:Colors.black,
                            border: Border.all(width: 1.5,color: Colors.white),
                            borderRadius: BorderRadius.circular(22)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.remove,size: 18,color: Colors.white,)),
                            Text("1",style: TextStyle(color: Colors.white,)),
                            IconButton(onPressed: (){}, icon: Icon(Icons.add,size: 18,color: Colors.white,)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 58,
                      width: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        color: Colors.pink,
                      ),
                      child: Center(child: Text("Add to Cart",style: TextStyle(color: Const.whiteColor,fontWeight: FontWeight.w500),)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ));
  }
}
Widget getColorToneWidget(Color mColor){
  return Container(
    width: 30,
    height:20,
    decoration: BoxDecoration(
        color: mColor,
        borderRadius: BorderRadius.circular(52)
    ),
  );
}
