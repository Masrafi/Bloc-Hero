import 'dart:convert';

import 'package:http/http.dart';

import '../model/todayCount_model.dart';
import '../utils/config.dart';

class RepositoryToday {
  var endPoint = Config.TODAY_REPO;
  Future getTodayCountData() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => TodayCountModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
