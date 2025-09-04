import 'package:e_commerce_app/data/remote/helper/api_helper.dart';
import 'package:e_commerce_app/utlils/constants/app_urls.dart';

class OrderRepository{
  ApiHelper apiHelper;
  OrderRepository({required this.apiHelper});

  dynamic createOrder({required cart_id}) async {
    Map<String,dynamic> orderParams = {
      "cart_id":"$cart_id"
    };
    try{
      var orderRes = apiHelper.postApi(url: AppUrls.create_url,mBodyParams: orderParams);
      return orderRes;
    }catch(e){
      rethrow;
    }

  }
}