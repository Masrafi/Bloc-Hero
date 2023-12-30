import 'package:http/http.dart' as http;
import 'ApiEndPoint.dart';
import 'NetworkApiService.dart';

class Repo{
  Future<http.Response> callSignInApi({dynamic data}) async {
      try {
        final response = await NetworkApiService
            .postApi(ApiEndPoint.signIn, data);
        return response;
      } catch (e) {
        throw Exception(e);
      }
    }
  
  
  // pass your Query parameters Map into data like this
  final Map<String, dynamic> data = {
    'username_email': userName,
    'password': password,
  };
  
   callSignInApi(data: data).
    then((Response value) async {
      if(value.statusCode == 200){
      // your model class 
      // you can convert your json to Dart from here https://app.quicktype.io/
      final SignInModel signInModel = SignInModel.fromJson(jsonDecode(value.body)); 
      // now you have your api response in signInModel, you can consume
      // it according to your need
      }
    }).catchError((e, StachTrace){
      debugPrint("ERROR--${e.toString()}");
    });

}