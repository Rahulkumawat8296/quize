import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quize/model/login_model.dart';
import 'package:quize/utils/api_url.dart';

Future<LoginModel> loginrepo({email, context, password}) async {
  var map = <String, dynamic>{};
  map['email'] = email;
  map['password'] = password;
  try {
    http.Response response = await http.post(
      Uri.parse(ApiUrl.SignUp),
      headers: await getAuthHeader(),
      body: jsonEncode(map),
    );
    if (response.statusCode == 200) {
      return LoginModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      return LoginModel(message: jsonDecode(response.body)['messages']);
    }
  } catch (e) {
    throw Exception("Failed to loaded data:$e");
  }
}
