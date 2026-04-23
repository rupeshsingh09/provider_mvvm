import 'package:flutter/widgets.dart';
import 'package:provider_mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{

  // use se related jo v info . rhega vh save krenge eski help se
  Future<bool> saveUser(UserModel user) async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());

    return true;
  }

  Future<UserModel> getUser()async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return UserModel(
    token : token.toString()
    );
  }


  // user logout hoga to details removed ke liye

Future<bool> remove()async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
}
}