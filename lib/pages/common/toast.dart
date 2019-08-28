import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

 void showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  void closeToast(){
    Fluttertoast.cancel();
  }