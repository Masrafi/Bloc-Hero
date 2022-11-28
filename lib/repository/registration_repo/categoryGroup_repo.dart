import 'dart:convert';

import 'package:http/http.dart';

import '../../model/registration_model/categoryGroup_model.dart';
import '../../model/todayCount_model.dart';
import '../../model/details_model/todayTenderDetails.dart';
import '../../utils/config.dart';

class RepositoryCategoryGroup {
  String endPoint = Config.CATEGORY_GROUP;
  Future getCategoryGroupData() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => CategoryGroupModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
