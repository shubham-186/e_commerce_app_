import 'dart:convert';
import 'dart:io';
import 'package:e_commerce_app/data/remote/helper/app_exception.dart';
import 'package:e_commerce_app/utlils/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Api_helper{
  /// get_api

  /// post_api
  Future<dynamic> post_api({required String url,Map<String,
      dynamic>? mBodyParams, Map<String, String>?
  mHeders, bool isAuth = false,
  }) async {
    mHeders ??= {'Content-Type': 'application/json',
      'Accept': 'application/json',};
    if (!isAuth) {
      SharedPreferences sharePreff = await SharedPreferences.getInstance();
      String token = sharePreff.getString(Const.prefUserToken) ?? "";
      print(Const.prefUserToken);
      mHeders["Authorization"] = "Bearer $token";
    }
    try {
      var res = await http.post(
        Uri.parse(url),
        body: jsonEncode(mBodyParams),
        headers: mHeders,
      );
      return jsonResException(res);
    } on SocketException {
      throw NetworkException(errorMsg: "No Internet");
    } catch (e) {
      throw ServerException(errorMsg: 'server issue: $e');
    }
  }
  dynamic jsonResException(http.Response response){

    switch (response.statusCode){
      case 200:{
        var resData = jsonDecode(response.body);
        return resData;
      }
      case 400:
        throw InvalidRequestException(errorMsg: "Bad Request");
      case 401:
        throw UnAuthorizedException(errorMsg: "Unauthorized Access");
      case 404:
        throw NetworkException(errorMsg: "Not Connected");
      case 500:
        throw ServerException(errorMsg: response.body.toString());
      default:
        throw ServerException(errorMsg: "Error Occurred while Communicated with server");
    }
  }
}
