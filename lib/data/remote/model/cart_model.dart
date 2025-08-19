class CartModel{
  int id;
  String image;
  String name;
  String price;
  int product_id;
  int quantity;

  CartModel({
    required this.image,
    required this.price,
    required this.name,
    required this.id,
    required this.quantity,
    required this.product_id
  });
 factory CartModel.fromJson(Map<String,dynamic> jsonData){
    return CartModel(
        image: jsonData["image"],
        price:jsonData["price"],
        name: jsonData["name"],
        id:jsonData["id"],
        quantity:jsonData["quantity"],
        product_id:jsonData["product_id"]
    );
  }
}
class CartDataModel{
  String message;
  bool status;
  List<CartModel> data;

  CartDataModel({
   required this.message,
   required this.status,
   required this.data
});
  factory CartDataModel.fromJson(Map<String,dynamic>jsonData){
    List<CartModel> cartList = [];
    for(Map<String,dynamic> eachCart in jsonData["data"]){
     CartModel cartModel = CartModel.fromJson(eachCart);
     cartList.add(cartModel);
    }
    return CartDataModel(
        message: jsonData["message"],
        status: jsonData["status"],
        data:cartList
    );
  }
}