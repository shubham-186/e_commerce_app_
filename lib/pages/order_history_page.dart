import 'dart:math';
import 'package:intl/intl.dart';
import 'package:e_commerce_app/ui/OrderHistory/OrderBloc/order_history_bloc.dart';
import 'package:e_commerce_app/ui/OrderHistory/OrderBloc/order_history_event.dart';
import 'package:e_commerce_app/ui/OrderHistory/OrderBloc/order_history_state.dart';
import 'package:e_commerce_app/ui/my_orders/bloc/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistory extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return OrderHistoryState();
  }
}
class OrderHistoryState extends State<OrderHistory>{
  @override
  void initState() {
    super.initState();
    context.read<OrderHistoryBloc>().add(OrderHistoryFetchEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        title: Text("Order History",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
        actions: [Image.asset("assets/icons/clock.png",
          height: 20,
          width: 20,
          color: Colors.white,
        ),
          SizedBox(width: 14,)
        ],
      ),
      body: BlocConsumer<OrderHistoryBloc, MyOrderHistoryState>(
        listener: (ctx,state){
          if(state is OrderHistoryFailiurState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg),backgroundColor: Colors.red,));
            print(state.errorMsg);
          }
        }, builder: ( ctx, state) {
          if(state is OrderHistoryLoadingState){
            return Center(child:  CircularProgressIndicator(color:Colors.pink,),);
          }
          if(state is OrderHistoryLoadedState){
           return Padding(
             padding: const EdgeInsets.all(4.0),
             child: ListView.builder(
               itemCount: state.getOrders.orders.length,
               itemBuilder: (context, index) {
                 var productList = state.getOrders.orders[index];
                 return Card(
                   elevation: 3,
                   color: Colors.white,
                   child: ExpansionTile(
                     // backgroundColor aur collapsedBackgroundColor ko white karein
                     backgroundColor: Colors.white,
                     collapsedBackgroundColor: Colors.white,
                     title: Row(
                       children: [
                         Text('Order ID:', style: TextStyle(fontWeight: FontWeight.w500),),
                         SizedBox(width: 4,),
                         Text(productList.order_number, style: TextStyle(fontSize: 14),),
                       ],
                     ),
                     subtitle: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               DateFormat('dd MMM, yyyy').format(
                                   DateTime.parse(productList.created_at)
                               ),
                             ),
                             Text('₹${productList.total_amount}',
                               style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w600),),
                           ],
                         ),
                         Text("item: ${productList.product.length}")
                       ],
                     ),
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.all(6.0),
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             children: [
                               ...productList.product.map((item) {
                                 return Container(
                                   height: 90,
                                   child: Column(
                                     children: [
                                       Row(
                                         children: [
                                           Card(
                                             elevation: 2,
                                             child: Container(
                                               height: 60,
                                               width: 60,
                                               decoration: BoxDecoration(
                                                 color: Colors.white,
                                                 borderRadius: BorderRadius.all(Radius.circular(12)),
                                               ),
                                               child: Image.network(
                                                 item.image,
                                                 height: 100,
                                                 width: 100,
                                                 fit: BoxFit.fill,
                                               ),
                                             ),
                                           ),
                                           SizedBox(width: 8),
                                           Expanded(
                                             child: Container(
                                               height: 78,
                                               child: Column(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   SizedBox(height: 6),
                                                   Text(
                                                     item.name,
                                                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                                   ),
                                                   Text("Quantity: ${item.quantity}"),
                                                   Text("price:${item.price}"),
                                                 ],
                                               ),
                                             ),
                                           )
                                         ],
                                       ),
                                       SizedBox(height: 7,),
                                       Container(width: 250,height: 1,color: Colors.grey.shade200,)
                                     ],
                                   ),
                                 );
                               }).toList(),
                             ],
                           ),
                         ),
                       ),
                     ],
                   ),
                 );
               },
             ),
           );
          }
          return Container();
          }
      ),
    );
  }
}