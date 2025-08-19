import 'dart:async';
import 'package:e_commerce_app/app_root/app_Routes.dart';
import 'package:e_commerce_app/const/widget_tools.dart';
import 'package:e_commerce_app/data/remote/model/discount_model.dart';
import 'package:e_commerce_app/data/remote/model/product_model.dart';
import 'package:e_commerce_app/data/remote/model/wish_model.dart';
import 'package:e_commerce_app/ui/product_detail/bloc/product_bloc.dart';
import 'package:e_commerce_app/ui/product_detail/bloc/product_event.dart';
import 'package:e_commerce_app/ui/product_detail/bloc/product_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../utlils/constants/app_constants.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isLiked = false;
  List<bool> likedStatus = [];
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetAllProductEvent());

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      // Agar current page aakhri page hai, to pehle page par wapas aa jayein
      if (_pageController.page == DiscountModel.discount_list.length - 1) {
        _pageController.animateToPage(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      } else {
        // Agle page par jayein
        _pageController.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    });
  }
  void dispose() {
    // Ab widget destroy hone par timer ko cancel karein
    _timer.cancel();
    // PageController ko bhi dispose karna zaroori hai
    _pageController.dispose();
    super.dispose();

  }

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Const.whiteColor,
      appBar:  AppBar(
        backgroundColor: Const.whiteColor,
        leading: Icon(Icons.grid_view),
        actions: [
          Icon(Icons.notification_add_outlined),
          SizedBox(width: 12,)
          // Icon(Icons.grid_view),
        ],
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
                    itemCount: DiscountModel.discount_list.length,
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
                                      borderRadius: BorderRadius.circular(5),
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
                            SizedBox(height: 5,),
                            /// 🔹 Image section
                            Container(
                              width: 135,
                              height: 145,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: AssetImage("${DiscountModel.discount_list[index]["image"]}"),
                                  fit: BoxFit.fill,
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
            height: 100,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: WishModel.list.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height:70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(
                            width: 1.5,
                            // color:Const.themeColor
                            color:Colors.pink
                          ),
                          // color: Const.themeColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset("${WishModel.list[index]["image"]}",fit: BoxFit.contain,
                            height: 55,
                            width: 55,
                          )
                        ),
                      ),
                      SizedBox(height:4), // spacing between circle and text
                      Text(
                        "${WishModel.list[index]["name"]}",
                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
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
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoutes.TOPDEAL);
                    },
                      child: Row(
                        children: [
                    Text("See all",style: TextStyle(color: Colors.pink.shade500,decoration: TextDecoration.underline,decorationColor: Colors.pink ),),
                    SizedBox(width: 4,),
                    Image.asset("assets/icons/right_ic.png", height: 12, width: 12, color: Colors.pink,)],))
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          BlocBuilder<ProductBloc,ProductState>(
            builder: (cxt_,state){
              if(state is ProductLoadingState){
               return Center(child: CircularProgressIndicator(color: Colors.pink,),);
              }
              if(state is ProductErrorState){
                return Center(child: Text('Error: ${state.errorMsg}'),);
              }
              if(state is ProductLoadedState){
                var productList = state.mProducts.data;
                if(likedStatus.length != productList.length){
                  likedStatus = List.generate(productList.length,(pos){
                    return false;
                  });
                }
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                        itemCount:productList.length,
                        gridDelegate:
                        SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 160,
                          childAspectRatio: 2.8/4.6,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (ctx,index){
                          var productItems = state.mProducts.data[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, AppRoutes.PRODUCT_DETAILS,arguments: productItems);
                            },
                            child: Container(
                              // height: 200,
                              // width: 120,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1,
                                      color: Colors.pink
                                  ),
                                  borderRadius: BorderRadius.circular(7)
                              ),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row (
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(onPressed: (){
                                        setState(() {
                                          likedStatus[index] = !likedStatus[index];
                                          print("isLiked response: $likedStatus");
                                        });
                                      }, icon:
                                      Icon(
                                        likedStatus[index]?
                                        Icons.favorite:Icons.favorite_outline_outlined,
                                        color: likedStatus[index] ? Colors.red:Colors.grey,
                                      )
                                      ),],
                                  ),
                                  Container(
                                      height: 105,
                                      width: 115,
                                      // decoration: BoxDecoration(border: Border.all(width: 1)),
                                      // child:Image.asset(productItems.image,)
                                      child:Image.network(productItems.image,fit: BoxFit.fill,)
                                  ),
                                  SizedBox(height: 12,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Text(
                                      productItems.name,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis, // <-- Ye property add karein
                                      maxLines: 1, // <-- Ye property add karein
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(Const.indCurr+productItems.price,style: TextStyle(
                                          fontSize: 13,fontWeight: FontWeight.bold,
                                        ),),
                                        SizedBox(width: 8,),
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
                                  SizedBox(height: 14),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context, AppRoutes.CART_PAGE);
                                    },
                                    child: Container(
                                      height: 29,
                                      width: 115,
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Center(
                                        child: Text("Buy",
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
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
  /*Widget LikeHeartWidget({required bool isLiked}) {
    return IconButton(onPressed: () {
      isLiked = !isLiked;
    }, icon: Icon(
      isLiked ? Icons.favorite : Icons.favorite_outline_outlined,
      color: isLiked ? Colors.red : Colors.grey,
      size: 30,
    )
    );
  }*/
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