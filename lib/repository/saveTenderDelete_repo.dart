import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../utils/config.dart';

class SafeTenderDeleteRepo {
  Future saveTenderDelete(String email, String pass) async {
    var endPoint = Config.DELETE_SAVE_TENDER;
    Response response = await post(Uri.parse(endPoint),
        body: {"Email": email, "tendercode": pass});
    print(response.body);
    return jsonDecode(response.body);
  }
}
