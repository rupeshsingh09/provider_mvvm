import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_mvvm/utils/routes/routes_name.dart';
import 'package:provider_mvvm/view/home_screen.dart';

import '../../view/login_view.dart';

class Routes {



  static Route<dynamic> generateRoute(RouteSettings settings) {
final arguments = settings.arguments;
    switch(settings.name){

      // page p jane k liye case bnaye h , aise hi jitna page rhega utna case bnayenge
      case Routesname.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());

        // dusra page p jane k liye
      case Routesname.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginView());
      default:
        // agr glt page ka path denge defaults msg aa jayeg ki no routes defined
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No routes definied'),
            ),
          );
        });
    }
  }
}