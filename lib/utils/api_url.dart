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


class Helpers {
  static OverlayEntry overlayLoader(BuildContext context) {
    return OverlayEntry(
      builder: (context) =>  Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black,
            ),
          ),
          // Animated loader in the center
          const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              strokeWidth: 4,
            ),
          ),
        ],
      ),
    );
  }
  static void hideLoader(OverlayEntry loader) {
    loader.remove();
  }
}

Future<LoginModelApi> LoginRepo({email, context, password}) async{
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context).insert(loader);
  var map= <String ,dynamic> {};
  map['email'] = email;
  map ['password'] = password;
  printDebug(map);
  http.Response response = await http.post(Uri.parse(ApiUrlClass.loginAuth),
    headers:  await getAuthHeaderApi(), body: jsonEncode(map),);
  if(response.statusCode ==200){
    Helpers.hideLoader(loader);
    printDebug("Login Api ${response.body}");
    return LoginModelApi.fromJson(jsonDecode(response.body));
  }
  else{
    Helpers.hideLoader(loader);
    return LoginModelApi(
        message: jsonDecode(response.body)['message']);

  }


}

printDebug(object, {String? title}) {
  if (kDebugMode) {
    debugPrint(
        " ---------------------\x1B[35m ${title ?? 'Debug Print Start'} \x1B[0m ------------------------------\x1B[0m\n"
            "${'\x1B[32m $object\x1B[0m'}"
            "\n \x1B[36m ----------------------------------------------------------------------\x1B[0m");
  }
}
