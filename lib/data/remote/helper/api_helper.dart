import 'dart:convert';
import 'dart:io';
import 'package:e_commerce_app/data/remote/helper/app_exception.dart';
import 'package:e_commerce_app/data/remote/model/product_model.dart';
import 'package:e_commerce_app/utlils/constants/app_constants.dart';
import 'package:e_commerce_app/utlils/constants/app_urls.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper {
  ///get
  getApi({
    required String url,
    Map<String, String>? mHeader,
    bool isAuth = false,
  }) async{

    if (isAuth == false) {
      mHeader ??= {};

      String token = "";
      ///get user token from prefs
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString(Const.prefUserToken) ?? "";

      mHeader["Authorization"] = "Bearer $token";
    }
    try {
      var res = await http.get(
        Uri.parse(url),
        headers: mHeader,
      );
      print(res.body);
      return handleResponse(res);
    } on SocketException {
      throw (NetworkException(message: "No Internet Connection"));
    } catch (e) {
      throw (ServerException(message: "Server Error: $e"));
    }

  }

  ///post
  Future<dynamic> postApi({
    required String url,
    Map<String, dynamic>? mBodyParams,
    Map<String, String>? mHeader,
    bool isAuth = false,
  }) async {
    if (isAuth == false) {
      mHeader ??= {};

      String token = "";
      ///get user token from prefs
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString(Const.prefUserToken) ?? "";

      mHeader["Authorization"] = "Bearer $token";

    }
    try {
      var res = await http.post(
        Uri.parse(url),
        body: jsonEncode(mBodyParams),
        headers: mHeader,
      );
      // print(res.body);
      return handleResponse(res);
    } on SocketException {
      throw (NetworkException(message: "No Internet Connection"));
    } catch (e) {
      throw (ServerException(message: "Server Error: $e"));
    }
  }
  dynamic allProductAPI({
    required String url,
    String? token,
    Map<String,String>? mHeader,
    isAuth = false
  })async{
    if(isAuth == false){
      mHeader = {};
    }
    SharedPreferences sp = await SharedPreferences.getInstance();
   token = sp.getString(Const.prefUserToken)??"";
    mHeader = {"Authorization":"Bearer $token"};
    // print("${token}");
    try{
      var prodRes = await http.post(Uri.parse(url),headers: mHeader);
      // print("prodRes ${prodRes.body}");
      return handleResponse(prodRes);
    }on SocketException {
      throw (NetworkException(message: 'No Internet'));
    }catch(e){
      throw (ServerException(message: '$e'));
    }
  }
  dynamic handleResponse(http.Response res) {
    switch (res.statusCode) {
      case 200:
        var mData = jsonDecode(res.body);
        return mData;
      case 400:
        throw (InvalidInputException(message: "Bad Request"));
      case 401:
        throw (UnauthorizedException(message: "Unauthorized Access"));
      case 404:
        throw (NetworkException(message: "Not Connected"));
      case 500:
        throw (ServerException(message: "Internal Server Error"));
      default:
        throw (ServerException(message: "Unknown Error: ${res.statusCode}"));
    }
  }
}
