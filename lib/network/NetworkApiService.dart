import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'BaseApiService.dart';

class NetworkApiService implements BaseApiService {
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      // you can handel all your exception here
      default:
        debugPrint("Error with Connection");
    }
  }

  @override
  Future getApi(String url, dynamic data) async {
    String queryString = '';
    String requestUrl = '';
    if (data == null) {
      requestUrl = url;
    } else {
      queryString = Uri(queryParameters: data).query;
      requestUrl = '$url?$queryString';
    }
    final headers = {"Accept": "application/json"};
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(requestUrl), headers: headers).timeout(
                const Duration(
                  seconds: 20,
                ),
              );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getApiWithAuth(String url, data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token')!;
    String queryString = '';
    String requestUrl = '';
    if (data == null) {
      requestUrl = url;
    } else {
      queryString = Uri(queryParameters: data).query;
      requestUrl = '$url?$queryString';
    }
    final headers = {
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    };
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(requestUrl), headers: headers).timeout(
                const Duration(
                  seconds: 20,
                ),
              );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future<http.Response> postApi(String url, dynamic data) async {
    dynamic responseJson;
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response = await http
          .post(Uri.parse(url), body: json.encode(data), headers: headers)
          .timeout(const Duration(seconds: 30));
      return responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      log('error$e');
    }
    return responseJson;
  }

  @override
  Future postApiWithAuth(String url, data, token) async {
    dynamic responseJson;
    if (token == null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
    }
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await http
          .post(Uri.parse(url), body: json.encode(data), headers: headers)
          .timeout(const Duration(seconds: 30));
      return responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      log('error$e');
    }
    return responseJson;
  }

  @override
  Future postApiWithAuthAndFile(String url, File file) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token')!;
    dynamic responseJson;
    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      request.headers.addAll(headers);
      request.files.add(http.MultipartFile.fromBytes(
          "file", File(file.path).readAsBytesSync(),
          filename: file.path));
      var res = await request.send();
      if (res.statusCode == 200) {
        final resp = await http.Response.fromStream(res);
        return responseJson = returnResponse(resp);
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      log('error$e');
    }

    return responseJson;
  }
}