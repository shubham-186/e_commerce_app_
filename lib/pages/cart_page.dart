import 'package:e_commerce_app/app_root/app_Routes.dart';
import 'package:e_commerce_app/data/remote/model/cart_model.dart';
import 'package:e_commerce_app/data/remote/model/product_model.dart';
import 'package:e_commerce_app/ui/my_cart/bloc/cart_bloc.dart';
import 'package:e_commerce_app/ui/my_cart/bloc/cart_event.dart';
import 'package:e_commerce_app/ui/my_cart/bloc/cart_state.dart';
import 'package:e_commerce_app/ui/my_orders/bloc/order_bloc.dart';
import 'package:e_commerce_app/ui/my_orders/bloc/order_event.dart';
import 'package:e_commerce_app/ui/my_orders/bloc/order_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../utlils/constants/app_constants.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isLoading = false;
  bool isDeleting = false;
  int qty = 0;
  var calculateCost = 0;
  var totalCost = 0;
  var getPrice = 0;
  int totalProductPrice = 0;

  List<int> cart_id = [];
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(ViewCartEvent());
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Const.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        backgroundColor: Const.whiteColor,
        title:Text("My Cart",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
        // leading: IconButton(onPressed: (){
        //   // Navigator.pop(context);
        // }, icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Column(
        children: [
          BlocBuilder<CartBloc,CartState>(
              builder: (cxt_,state) {
                if(state is CartLoadedState) {
                  // totalCost = 0;
                 totalProductPrice = calculateCartData(state.cartDataModel_res.data);
                 cart_id.clear();
                 print("Product Price: $totalProductPrice");
                  return Expanded(
                    child:  ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        itemCount:state.cartDataModel_res.data.length
                        ,itemBuilder: (ctx,index)
                    {
                      CartModel dataItems = state.cartDataModel_res.data[index];
                     var pro_id = dataItems.id;
                      cart_id.add(pro_id);
                      print("The product ID's are: $cart_id");
                      // cartID = dataItems.id;
                      // position = index;
                      // print("The Product names is: ${dataItems.quantity}");
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 3),
                                    SizedBox(
                                      height: 65,
                                      width: 65,
                                      // decoration: BoxDecoration(border: Border.all(width: 1)),
                                      child: Image.network(dataItems.image),
                                    ),
                                    SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 235,
                                          height: 35,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  dataItems.name,
                                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              BlocConsumer<CartBloc,CartState>(
                                                  listener: (ctx,state){
                                                    // if(state is CartLoadingState){
                                                    //   // Center(child: CircularProgressIndicator(color: Colors.pink,),);
                                                    //   SizedBox(
                                                    //     width: 200.0,
                                                    //     height: 100.0,
                                                    //     child: Shimmer.fromColors(
                                                    //       baseColor: Colors.red,
                                                    //       highlightColor: Colors.yellow,
                                                    //       child: Text(
                                                    //         'Shimmer',
                                                    //         textAlign: TextAlign.center,
                                                    //         style: TextStyle(
                                                    //           fontSize: 40.0,
                                                    //           fontWeight:
                                                    //           FontWeight.bold,
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //   );
                                                    // }
                                                    if(state is CartDeletedSucceed){
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.deletedSucceedMsg,style: TextStyle(color: Colors.white),),backgroundColor: Colors.green,),);
                                                      print("Deleted Status: ${state.deletedSucceedMsg}");
                                                    }
                                                    // if(state is CartLoadedState){}
                                                    /*if(state is CartFailiurState){
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg,style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,),);
                                                      print("Deleted Status: ${state.errorMsg}");
                                                    }*/
                                                  },
                                                  builder:(ctx,state)  {
                                                    return IconButton(
                                                      onPressed: () {
                                                        context.read<CartBloc>().add(CartDeleteEvent(cart_id:dataItems.id));
                                                        print("Deleted Button Tapped");
                                                        // print("deleted item id is: ${cartID}");
                                                      },
                                                      icon: Image.asset(
                                                        "assets/icons/bin.png",
                                                        width: 20,
                                                        height: 20,
                                                        color: Colors.pink,
                                                      ),
                                                    );
                                                  }
                                              )
                                            ],
                                          ),
                                        ),
                                        // SizedBox(height: 1), // 👈 Gap controlled
                                        Text(
                                          "Electronics",
                                          style: TextStyle(fontSize: 12, color: Colors.grey.shade400, fontWeight: FontWeight.w400,height: 1.1),
                                        ),
                                        SizedBox(height: 6,),
                                        Container(
                                          width: 235,
                                          height: 40,
                                          // decoration: commonBorderDecoration(),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(Const.indCurr+dataItems.price,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                                              Container(
                                                width: 120,
                                                height: 32,
                                                decoration: BoxDecoration(
                                                    color: Color(0x86F7F7F7),
                                                    border: Border.all(width: 1,color: Colors.grey.shade200),
                                                    borderRadius: BorderRadius.circular(22)
                                                ),
                                                child: BlocConsumer<CartBloc,CartState>(
                                                  builder: (ctx,state){
                                                    if(state is CartFailiurState){
                                                      return Text("${state.errorMsg}");
                                                    }
                                                    if(state is CartLoadedState){
                                                      return Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          IconButton(onPressed: (){
                                                            context.read<CartBloc>().add(DecrementEvent(
                                                                user_id: dataItems.id,
                                                                pro_id: dataItems.product_id,
                                                                qty: 1,
                                                            ));
                                                          }, icon: Icon(Icons.remove,size: 18,color: Colors.black87,)),
                                                          Text("${dataItems.quantity}"),
                                                          IconButton(onPressed: (){
                                                            context.read<CartBloc>().add(AddToCartEvent(pro_id: dataItems.product_id, qty: 1));
                                                          }, icon: Icon(Icons.add,size: 18,)),
                                                        ],
                                                      );
                                                    }
                                                    return CircularProgressIndicator();
                                                  },
                                                  listener: (_,state){
                                                    if(state is CartFailiurState){
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.errorMsg}")));
                                                    }
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }
                if(state is CartFailiurState){
                  print("The error is: ${state.errorMsg}");
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg,style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,));
                }
                return Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.asset("assets/icons/empty_cart.png",
                        width: 329,
                        height: 329,
                      ),
                      Text("Your Cart is Empty 🥺",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),)
                    ],
                  )
                );
              }
          ),
          SizedBox(height: 5,),
        ],
      ),
      bottomSheet: BlocBuilder<CartBloc,CartState>(
        builder: (ctx_,state){
          if(state is CartLoadedState){
            totalProductPrice = calculateCartData(state.cartDataModel_res.data);
            return Container(
              height: 227,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  // boxShadow: [
                  // BoxShadow(
                  // color: Colors.grey.withOpacity(0.5),
                  // offset: Offset(0, 6), // 👈 negative y-offset = shadow upar se aayega
                  // blurRadius: 6,
                  // spreadRadius: 8,
                  // ),
                  // ],
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  )),
              child: Column(
                children: [
                  SizedBox(height: 12,),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    // decoration: commonBorderDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.5),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(fontSize: 12,color: Colors.black12),
                              decoration: InputDecoration(
                                  filled: true, // 👈 Yeh zaruri hai!
                                  fillColor: Colors.grey.shade50,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                  hintText: "Enter Discount Code",
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide: BorderSide(color: Colors.grey.shade50)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide: BorderSide(color: Colors.grey.shade50)
                                  )
                              ),
                            ),
                          ),
                          SizedBox(width: 7,),
                          Text("Apply",style: TextStyle(
                              fontSize: 12,
                              color: Colors.pink,
                              fontWeight: FontWeight.w600
                          ),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                      ),
                      color: Colors.white,
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",style: TextStyle(fontSize: 12,color: Colors.grey.shade500),),
                            Text(" ${Const.indCurr+totalProductPrice.toStringAsFixed(2)}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total"),
                        Text(Const.indCurr+totalProductPrice.toStringAsFixed(2),
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 3, // Shadow depth (zyada karna ho to increase karo)
                    child: BlocConsumer<OrderBloc,OrderState>(
                      listener: (context,state){
                        if(state is UserLoadingState){
                          isLoading = true;
                        }
                        if(state is OrderSucceedState){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.suceedMsg),
                            backgroundColor:Colors.green,));
                          Navigator.pushReplacementNamed(context, AppRoutes.DASHBOARD);
                          isLoading = false;
                        }
                        if(state is OrderFailureState){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg),
                            backgroundColor: Colors.red,));
                          isLoading = false;
                        }
                      },
                      builder: (context,state) {
                        return GestureDetector(
                          onTap: (){
                            context.read<OrderBloc>().add(CreateOrderEvent(cart_id: cart_id));
                          },
                          child: isLoading? Row(
                            children: [
                            Text("Buying", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                            ],
                          ):Container(
                            height: 49,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Center(
                              child: Text("Checkout", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            );
          }
          if(state is CartFailiurState){
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg)));
          }
          return Container(height: 0,);
        },

      ) ,
    );
  }

  int calculateCartData(List<CartModel> cartItems) {
    totalCost = 0;
    for(var items in cartItems){
      getPrice = int.parse(items.price);
      calculateCost = getPrice * items.quantity;
      print("Now the Product name is:${items.name} & the Quantity incremented:${items.quantity}");
      totalCost = totalCost+calculateCost;
      print("the Total Cost is: $totalCost");
    }
    return totalCost;
  }
}
