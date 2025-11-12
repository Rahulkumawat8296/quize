import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiUrl {
  static const String SignUp = "https://team.thebestdeals.app/api/auth/signin";
}

Future getAuthHeader() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var gg = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    if (prefs.getString('cookie') != null)
      HttpHeaders.authorizationHeader:
          'Bearer ${prefs.getString('cookie')!.toString().replaceAll('\n', '')}'
  };
  return gg;
}

void showToast(String messages) {
  Fluttertoast.showToast(
      msg: messages,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}
