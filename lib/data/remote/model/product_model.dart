import 'dart:convert';

class ProductModel{
  String category_id;
  String created_at;
  String id;
  String image;
  String name;
  String price;
  String status;
  String updated_at;

  ProductModel({
    required this.status,
    required this.name,
    required this.id,
    required this.price,
    required this.category_id,
    required this.created_at,
    required this.image,
    required this.updated_at
  });
  factory ProductModel.fromjson(Map<String,dynamic>jsonData){
    return ProductModel(
        status: jsonData["status"],
        name:jsonData["name"] ,
        id: jsonData["id"],
        price:jsonData["price"] ,
        category_id:jsonData["category_id"] ,
        created_at:jsonData["created_at"] ,
        image: jsonData["image"],
        updated_at:jsonData["updated_at"]
    );
  }
}
class ProductDataModel{
  String message;
  bool status;
  List<ProductModel> data;

  ProductDataModel({
  required this.status,
  required this.message,
  required this.data,
});
  factory ProductDataModel.fromJson(Map<String,dynamic> jsonData){
    List<ProductModel> productList = [];
    for(Map<String,dynamic> productData in jsonData["data"]){
      productList.add(ProductModel.fromjson(productData));
    }
    return ProductDataModel(
    status: jsonData["status"],
    message: jsonData["message"],
    data: productList
  );
  }


}