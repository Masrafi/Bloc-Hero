import 'dart:convert';

import 'package:http/http.dart';

import '../model/todayCount_model.dart';

class RepositoryToday {
  String endPoint = "https://bdtender.com/api/count-todays-tender";
  getTodayCountData() async {
    Response response = await get(Uri.parse(endPoint));
    print(response.body);
    if (response.statusCode == 200) {
      print("...............................................");
      final List result = jsonDecode(response.body);
      return result.map((e) => TodayCountModel.fromJson(e)).toList();
    } else {
      print(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");
      throw Exception(response.reasonPhrase);
    }
  }
}
