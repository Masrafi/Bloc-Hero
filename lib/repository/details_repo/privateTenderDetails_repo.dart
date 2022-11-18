import 'dart:convert';

import 'package:http/http.dart';

import '../../model/details_model/privateTenderDetails.dart';
import '../../model/todayCount_model.dart';
import '../../model/details_model/todayTenderDetails.dart';
import '../../utils/config.dart';

class RepositoryPrivateTenderDetails {
  String endPoint = Config.PRIVATE_DETAILS;
  getPrivateTenderDetailsData() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => PrivateTenderDetailsModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
