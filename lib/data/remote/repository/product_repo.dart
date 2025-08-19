import 'package:e_commerce_app/data/remote/helper/api_helper.dart';
import 'package:e_commerce_app/data/remote/model/product_model.dart';
import 'package:e_commerce_app/utlils/constants/app_urls.dart';

class ProductRepository{
  // ProductDataModel productData;
  ApiHelper apiHelper;
  ProductRepository({required this.apiHelper});
  Future<dynamic> getAllProduct() async {
    try{
      var res = await apiHelper.allProductAPI(url:AppUrls.allProducts);
      return res;
    }catch(e){
      rethrow;
    }
  }
}