import 'dart:convert';

import 'package:http/http.dart';
import '../utils/config.dart';

class SafeTenderRepo {
  Future safeTender(String email, String code) async {
    var endPoint = Config.SAVE_TENDER;
    Response response = await post(Uri.parse(endPoint), body: {
      "Email": email,
      "tendercode": code,
    });
    return jsonDecode(response.body);
  }
}
