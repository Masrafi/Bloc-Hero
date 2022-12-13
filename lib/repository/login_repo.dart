import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../utils/config.dart';

class LoginRepo {
  Future login(String name, String pass) async {
    var endPoint = Config.LOGIN;
    Response response = await post(Uri.parse(endPoint), body: {
      "txtemail": name,
      "Password": pass,
    });
    print("This is test for login: ${response.body}");
    return jsonDecode(response.body);
  }
}
