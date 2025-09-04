import 'package:e_commerce_app/data/remote/helper/api_helper.dart';
import 'package:e_commerce_app/utlils/constants/app_constants.dart';
import 'package:e_commerce_app/utlils/constants/app_urls.dart';

class OrderHistoryRepo{
  ApiHelper apiHelper;
  OrderHistoryRepo({required this.apiHelper});

  dynamic getOrders_api(){
    try{
      var orders = apiHelper.getApi(url: AppUrls.orderHistory);
      return orders;
    }catch(e){
      rethrow;
    }
  }
}