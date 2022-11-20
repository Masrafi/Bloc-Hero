import 'dart:convert';

import 'package:http/http.dart';

import '../../model/details_model/corrigenTenderDetails.dart';
import '../../model/todayCount_model.dart';
import '../../model/details_model/todayTenderDetails.dart';
import '../../utils/config.dart';

class RepositoryCorrigenTenderDetails {
  String endPoint = Config.CORRIGEN_DETAILS;
  Future getCorrigenTenderDetailsData() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => CorrigenTenderDetailsModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
