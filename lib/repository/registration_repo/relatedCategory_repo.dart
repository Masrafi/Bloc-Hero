import 'dart:convert';
import 'package:bdtender_bloc/utils/config.dart';
import 'package:http/http.dart';

import '../../model/registration_model/relatedCategory_model.dart';

class RepositoryRelatedCategory {
  Future getRelatedCategoryData(String ghCode) async {
    var endPoint =
        'https://www.bdtender.com/api/relatedwith-categorygroup?category_id=${ghCode}';
    Response response = await get(Uri.parse(endPoint));
    print("This is related: ${response.body}");
    //if (response.statusCode == 200) {
    final List result = jsonDecode(response.body);
    return result.map((e) => RelatedCategoryModel.fromJson(e)).toList();
    // } else {
    throw Exception(response.reasonPhrase);
    //}
  }
}
