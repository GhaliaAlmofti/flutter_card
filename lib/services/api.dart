import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:saees_cards/helpers/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  Future<Response> get(String endPoint) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");
    final response = await http.get(
      Uri.parse("$baseUrl$endPoint"),

      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (kDebugMode) {
      print("RESPONSE GET : $baseUrl$endPoint");
      print("RESPONSE STATUS CODE : ${response.statusCode}");
      print("RESPONSE BODY : ${response.body}");
    }
    return response;
  }

  Future<Response> post(String endPoint, Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    final response = await http.post(
      Uri.parse("$baseUrl$endPoint"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",

      },
      body: body,
    );

    if (kDebugMode) {
      print("RESPONSE POST : $baseUrl$endPoint");
      print("RESPONSE STATUS CODE : ${response.statusCode}");
      print("RESPONSE BODY : ${response.body}");
    }
    return response;
  }

  Future<Response> put(String endPoint, Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    final response = await http.put(
      Uri.parse("$baseUrl$endPoint"),
      body: body,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",

      },
    );
    if (kDebugMode) {
      print("RESPONSE PUT : $baseUrl$endPoint");
      print("RESPONSE STATUS CODE : ${response.statusCode}");
      print("RESPONSE BODY : ${response.body}");
    }
    return response;
  }

  Future<Response> delete(String endPoint, Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    final response = await http.delete(
      Uri.parse("$baseUrl$endPoint"),
      body: body,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",

      },
    );

    if (kDebugMode) {
      print("RESPONSE DELETE : $baseUrl$endPoint");
      print("RESPONSE STATUS CODE : ${response.statusCode}");
      print("RESPONSE BODY : ${response.body}");
    }

    return response;
  }
  



Future<http.StreamedResponse> upload(File file, String endPoint) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");


  var request = http.MultipartRequest('POST', Uri.parse("$baseUrl$endPoint"));

  request.headers.addAll({
    "Accept": "application/json",
    "Authorization": "Bearer $token",
  });

  var multipartFile = await http.MultipartFile.fromPath(
    'file', 
    file.path,
  );
  request.files.add(multipartFile);

  final response = await request.send();

  if (kDebugMode) {
    print("RESPONSE UPLOAD : $baseUrl$endPoint");
    print("RESPONSE STATUS CODE : ${response.statusCode}");
  }

  return response;
}
}
