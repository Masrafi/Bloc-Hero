import 'dart:convert';

import 'package:http/http.dart';

import '../../utils/config.dart';

class RepositorySignUp {
  Future getSignUpData({
    required String name,
    required String designation,
    required String organization,
    required String email,
    required String phone,
    required String pass,
    required String group,
    required List cat,
  }) async {
    var endPoint = Config.Registration;
    Response response = await post(
      Uri.parse(endPoint),
      body: {
        "ContactPerson": name,
        "Designation": designation,
        "Organization": organization,
        "Phone": phone,
        "Email": email,
        "Password": pass,
        "Subscription_plan": group,
        "Subscriber_Category": cat.toString(),
      },
    );
    print("This is Registration: ${response.body}");
  }
}
