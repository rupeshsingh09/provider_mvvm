import 'package:provider_mvvm/utils/utils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_mvvm/respository/auth_respository.dart';

import '../utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo
        .loginApi(data)
        .then((value) {
          setLoading(false);
          Utils.flushBarErrorMessage('Login successfuly', context);

          // login hone p page navigate hone k liye 
          Navigator.pushNamed(context, Routesname.home);

          if (kDebugMode) {
            print(value.toString());
          }
        })
        .onError((error, stackTrace) {
          setLoading(false);

          if (kDebugMode) {
            // error print krne k liye
            Utils.flushBarErrorMessage(error.toString(), context);

            print(error.toString());
          }
        });
  }
}
