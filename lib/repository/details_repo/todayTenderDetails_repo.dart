import 'dart:convert';

import 'package:http/http.dart';

import '../../model/todayCount_model.dart';
import '../../model/details_model/todayTenderDetails.dart';
import '../../utils/config.dart';

class RepositoryTodayTenderDetails {
  String endPoint = Config.TODAY_DETAILS;
  Future getTodayTenderDetailsData() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => TodayTenderDetailsModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
