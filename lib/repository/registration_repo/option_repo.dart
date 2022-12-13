import 'dart:convert';
import 'package:bdtender_bloc/model/registration_model/option_model.dart';
import 'package:bdtender_bloc/utils/config.dart';
import 'package:http/http.dart';

import '../../model/registration_model/relatedCategory_model.dart';

class RepositoryOption {
  Future getOptionData(List ghCode) async {
    var endPoint = Config.OPTION;
    Response response = await post(
      Uri.parse(endPoint),
      body: {'category_id': ghCode.toString()},
    );
    print("This is related: ${response.body}");
    //if (response.statusCode == 200) {
    final List result = jsonDecode(response.body);
    return result.map((e) => OptionModel.fromJson(e)).toList();
    // } else {
    throw Exception(response.reasonPhrase);
    //}
  }
}
