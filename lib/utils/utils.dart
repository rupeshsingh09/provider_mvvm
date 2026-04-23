import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {


  // focus ke liye function bnye h  , all thing expalin in copy
  static void fieldFocusChange(BuildContext context,FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }



  // use of toastmessage & fluttertoast
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      // these below are charastericts of toastmesage
      backgroundColor: Colors.grey,
      textColor: Colors.yellow,
      fontSize: 20,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  // flushbar nam ka ek fun bnayenge, all thing are explain in copy
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.all(15),
        message: message,
        duration: Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: Icon(Icons.error, size: 28, color: Colors.white),

        // showcontext krenge tv show hoga sb msg ue color
      )..show(context),
    );
  }

  // snackbar k liye function bna rhe h
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Colors.red, content: Text(message)),
    );
  }
}
