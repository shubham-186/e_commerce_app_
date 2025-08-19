import 'package:e_commerce_app/data/remote/helper/api_helper.dart';
import 'package:e_commerce_app/utlils/constants/app_urls.dart';

class UserRepository {
  ApiHelper apiHelper;
  UserRepository({required this.apiHelper});

  Future<dynamic> loginUser({required String email, required String pass}) async{

    try{
      dynamic res = await apiHelper.postApi(
          url: AppUrls.login, isAuth: true,
          mBodyParams: {
            "email":email,
            "password":pass
          });
      return res;
    } catch(e){
      rethrow;
    }
  }

  Future<dynamic> signUpUser({
    required String name,
    required String mobNo,
    required String email,
    required String pass,
  }) async{

    try{
      dynamic res = await apiHelper.postApi(url: AppUrls.sign_up, isAuth: true, mBodyParams: {
        "name": name,
        "email": email,
        "mobile_number": mobNo,
        "password": pass
      });
      return res;
    } catch(e){
      rethrow;
    }

  }
}