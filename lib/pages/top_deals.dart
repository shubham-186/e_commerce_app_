import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_root/app_Routes.dart';
import '../ui/product_detail/bloc/product_bloc.dart';
import '../ui/product_detail/bloc/product_event.dart';
import '../ui/product_detail/bloc/product_state.dart';
import '../utlils/constants/app_constants.dart';
import 'homepage.dart';

class TopDeals extends StatefulWidget{
  @override
  State<TopDeals> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<TopDeals> {
  List<bool> likedStatus = [];
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetAllProductEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text("Top Deals",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
          ],
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
        actions: [
          Image.asset("assets/icons/shop_logoo.png")
        ],
      ),
      body:  BlocBuilder<ProductBloc,ProductState>(
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
              likedStatus = List.generate(productList.length, (i){
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
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 3,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  /*IconButton(onPressed: (){
                                    likedStatus[index] = !likedStatus[index];
                                    setState(() {});
                                  }, icon:likedStatus[index]?
                                  Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_outline_outlined)),*/
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        likedStatus[index] = !likedStatus[index];
                                      });
                                    },
                                      child: likedStatus[index]?
                                      Icon(Icons.favorite,color: Colors.red,):
                                      Icon(Icons.favorite_outline_outlined,)),
                                  SizedBox(width: 5,)
                                ],
                              ),
                              Container(
                                  height: 125,
                                  width: 114,
                                  // decoration: BoxDecoration(border: Border.all(width: 1)),
                                  // child:Image.asset(productItems.image,)
                                  child:Image.network(productItems.image,fit: BoxFit.fill,)
                              ),
                              SizedBox(height: 10,),
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
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, AppRoutes.CART_PAGE);
                                },
                                child: Container(
                                  height: 29,
                                  width: 115,
                                  decoration: BoxDecoration(
                                    // color: Colors.pink,
                                    border: Border.all(
                                      color: Colors.pink
                                    ),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Center(
                                    child: Text("Add to Cart",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.pink)),
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
      ),
    );
  }
}