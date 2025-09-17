import 'package:http/http.dart';

class ProductModel {
  int id;
  int quantity;
  String image;
  String name;
  String price;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity
  });

 factory ProductModel.fromJson(Map<String, dynamic>jsonData){
   return ProductModel(
       id: jsonData["id"],
       image: jsonData["image"],
       name: jsonData["name"],
       price: jsonData["price"],
       quantity: jsonData["quantity"]
   );
  }
}
class OrderModel{
  String created_at;
  int id;
  String order_number;
  String status;
  String total_amount;
  List<ProductModel> product;

  OrderModel({
    required this.id,
    required this.created_at,
    required this.order_number,
    required this.status,
    required this.total_amount,
    required this.product
  });
 factory OrderModel.fromJson(Map<String,dynamic>jsonData){
   List<ProductModel> order_details = [];
   for(Map<String,dynamic> products in jsonData["product"]){
     ProductModel getProducts = ProductModel.fromJson(products);
     order_details.add(getProducts);
   }
   return OrderModel(
        id: jsonData["id"],
       created_at: jsonData["created_at"],
       order_number: jsonData["order_number"],
       status: jsonData["status"],
       total_amount: jsonData["total_amount"],
       product: order_details
   );
 }
}
class OrdersDataModel{
  String message;
  bool status;
  List<OrderModel>orders;

  OrdersDataModel({
    required this.status,
    required this.message,
    required this.orders
  });
 factory OrdersDataModel.fromJson(Map<String,dynamic>jsonData){
   List<OrderModel> orderList = [];
   for(Map<String,dynamic> orders in jsonData["orders"]){
     OrderModel getOrders = OrderModel.fromJson(orders);
     orderList.add(getOrders);
   }
    return OrdersDataModel(
        status: jsonData['status'],
        message: jsonData['message'],
        orders: orderList
    );
  }
}