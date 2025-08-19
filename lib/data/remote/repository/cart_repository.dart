import 'package:e_commerce_app/data/remote/helper/api_helper.dart';
import 'package:e_commerce_app/utlils/constants/app_urls.dart';

class CartRepository{
  ApiHelper apiHelper;
  CartRepository({required this.apiHelper});
  dynamic AddToCart_api({required int prod_id,required int qty}){
    Map<String,dynamic> cartParams = {
      "product_id":prod_id,
      "quantity":qty
    };
    try{
      var cartRes = apiHelper.postApi(url: AppUrls.addCart_url,mBodyParams: cartParams);
      return cartRes;
    }catch(e){
      rethrow;
    }
  }
  dynamic fetchAllCarts_api() async {
    try{
      dynamic cartRes = await apiHelper.getApi(url: AppUrls.viewCart_url);
      return cartRes;
    }catch(e){
      rethrow;
    }
  }
  Future<dynamic> deleteProducts({required cart_id})async{
    try{
       dynamic delRes = await apiHelper.postApi(url: AppUrls.delete_url, mBodyParams: {
          "cart_id":cart_id
           });
       return delRes;
    }catch(e){
      rethrow;
    }
  }
  Future<dynamic> decrementQty({required int user_id,required int product_id,required int quantity})async{
    Map<String,dynamic>qtyParams = {

       // "user_id":user_id,
        "product_id":product_id,
        "quantity":quantity
    };
    try{
      dynamic decQty = await apiHelper.postApi(url: AppUrls.dec_url,mBodyParams: qtyParams);
      return decQty;
    }catch(e){
      rethrow;
    }

}
}
