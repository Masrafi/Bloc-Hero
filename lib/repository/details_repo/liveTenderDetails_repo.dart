import 'dart:convert';
import 'package:http/http.dart';

import '../../model/details_model/live111TenderDetails.dart';
import '../../utils/config.dart';

class RepositoryLiveTenderDetails {
  String endPoint = Config.LIVE_DETAILS;
  getLiveTenderDetailsData() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => LiveTenderDetailsModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
