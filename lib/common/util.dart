import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


// const STATUS_LOGIN = 'STATUS_LOGIN';
// const STATUS_LOGOUT = 'STATUS_LOGOUT';

void showToast(String message) {
  Fluttertoast.showToast(
    fontSize: 13,
    msg: '   $message   ',
    backgroundColor: Colors.black,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}