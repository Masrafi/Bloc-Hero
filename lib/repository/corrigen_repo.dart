import 'dart:convert';

import 'package:bdtender_bloc/utils/config.dart';
import 'package:http/http.dart';

import '../model/todayCount_model.dart';

class RepositoryCorrigen {
  var endPoint = Config.CORRIGEN_REPO;
  Future getCorrigenCountData() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => TodayCountModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
