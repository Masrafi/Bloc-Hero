import 'dart:convert';
import 'package:bdtender_bloc/model/saveTender_show.dart';
import 'package:bdtender_bloc/utils/config.dart';
import 'package:http/http.dart';

class RepositorySaveTenderShow {
  var endPoint = Config.SHOW_SAVE_TENDER;
  getSaveTendewrShowCountData() async {
    Response response = await post(Uri.parse(endPoint),
        body: {"Email": "masrafianam@gmail.com"});
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => SaveTenderShow.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
