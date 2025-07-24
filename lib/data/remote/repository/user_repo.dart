import 'package:e_commerce_app/data/remote/helper/api_helper.dart';
import 'package:e_commerce_app/utlils/constants/app_urls.dart';

class UserRepository{
 Api_helper api_helper;
 UserRepository({required this.api_helper});

  Future<dynamic> loginUser({required String email, required String pass})async{
    Map<String,dynamic> loginDetails = {
      "email":email,
      "password":pass
    };
    try{
      var res = await api_helper.post_api(url: AppUrls.login,mBodyParams:loginDetails ,isAuth: true);
      return res;
    }catch(e){
      rethrow;
    }
}
Future<dynamic> signUpUser({
  required String name,
  required String phone,
  required String email,
  required String pass,
})async{
    Map<String,dynamic> signDetials = {
     "name":name,
     "mobile_number":phone,
     "email":email,
     "password":pass,
    };
    try{
      var res = await api_helper.post_api(url: AppUrls.sign_up,mBodyParams: signDetials,isAuth: true);
      return res;
    }catch(e){
      rethrow;
    }
    // api_helper.post_api(url: AppUrls.sign_up,mBodyParams:signDetials ,isAuth: true);
    return true;
}
}