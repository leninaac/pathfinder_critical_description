import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pathfinder_project/data/repository/server_error.dart';

import 'api_response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'error_dialog.dart';

enum HttpMethodType {
  GET,
  POST,
  PUT,
  DELETE
}

class ApiManager{

  static Future<Map<String, String>> getHeaders() async {
    var headers = {
      "Accept": "*/*",
      'Content-Type': 'application/json'
    };
    return headers;
  }

  static ApiResponse handleErrorData(Response data) {
    try{
      final response = ApiResponse(error: false);
      //SUCCESS DATA
      if(data.statusCode >= 201 && data.statusCode < 300) {
        response.error = false;
        response.successData = true;
        return response;
      }
      //CLIENT ERROR
      if(data.statusCode >= 400 && data.statusCode < 500 && data.body.isNotEmpty) {
        final utfJson = const Utf8Decoder().convert(data.body.codeUnits);
        final jsonData = json.decode(utfJson);
        ServerError error = ServerError.fromJson(jsonData);
        response.errorMessage = error.message;
        response.error = true;
        return response;
      }
      //GENERIC ERROR
      response.error = true;
      response.errorMessage = "Não foi possível conectar ao servidor";
      return getGenericError2();
    } on Exception catch (_) {
      return getGenericError2();
    }
  }

  static ApiResponse<Object> handleServerData(ApiResponse<Object> result, Response data) {
    try {

      //SUCCESS DATA
      if(data.statusCode >= 201 && data.statusCode < 300) {
        result.error = false;
        result.successData = true;
        return result;
      }
      //CLIENT ERROR
      if(data.statusCode >= 400 && data.statusCode < 500 && data.body.isNotEmpty) {
        final jsonData = json.decode(data.body);
        ServerError error = ServerError.fromJson(jsonData);
        result.errorMessage = error.message;
        result.error = true;
        return result;
      }
      //GENERIC ERROR
      result.error = true;
      result.errorMessage = "Não foi possível conectar ao servidor";
      return getGenericError(result);
    } on Exception catch (_) {
      return getGenericError(result);
    }
  }

  static ApiResponse<Object> getGenericError(ApiResponse<Object> result) {
    result.error = true;
    result.errorMessage = "Não foi possível conectar ao servidor";
    return result;
  }

  static ApiResponse getGenericError2(){
    final result = ApiResponse(error: false);
    result.error = true;
    result.errorMessage = "Não foi possível conectar ao servidor";
    return result;
  }

  Future<Response> callService({required HttpMethodType type, required String url, Map<String, dynamic>? body, required bool validateSession}) async {
    url = url;
    String? reqBody;
    if (kDebugMode) {
      print("REQUEST");
    }
    if (kDebugMode) {
      print(url);
    }
    final headers = await getHeaders();
    if(body != null) {
      reqBody = json.encode(body);
      if (kDebugMode) {
        print(reqBody);
      }
    }
    Response response;
    switch (type){
      case HttpMethodType.GET : response = await http.get(Uri.parse(url), headers: headers);
      logResponse(response);
      break;
      case HttpMethodType.POST : response = await http.post(Uri.parse(url), headers: headers, body: reqBody);
      break;
      case HttpMethodType.PUT : response = await http.post(Uri.parse(url), headers: headers, body: reqBody);
      break;
      case HttpMethodType.DELETE : response = await http.delete(Uri.parse(url), headers: headers, body: reqBody);
      break;
    }
    logResponse(response);
    if(validateSession) {
      validateSessionError(response);
    }
    return response;
  }

  validateSessionError(Response response) {
    if(response.statusCode == 401) {
      ErrorDialog.showError("Sessão expirada");
    }
  }
  logResponse(Response result) {
    if (kDebugMode) {
      print("Status code response = " + result.statusCode.toString());
      print(result.body);
    }

  }
}