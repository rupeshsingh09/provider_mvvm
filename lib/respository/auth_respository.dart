import 'package:provider_mvvm/data/network/BaseApiServices.dart';
import 'package:provider_mvvm/data/network/NetworkApiService.dart';

import '../res/app_url.dart';

class AuthRepository {

  // netaoiservices ko call kr rhe h
  BaseApiServices _apiServices = NetworkApiServices();


  // for login api k liye
  Future<dynamic> loginApi(dynamic data) async {
    try{
     dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw e ; 
    }
  }


// for loginapi k liye

  Future<dynamic> registerApi(dynamic data) async {
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw e ;
    }
  }


}