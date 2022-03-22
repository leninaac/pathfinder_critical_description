import 'dart:convert';

import 'package:http/http.dart';
import 'package:pathfinder_project/data/models/effects_model.dart';
import 'package:pathfinder_project/data/repository/api_manager.dart';
import 'package:pathfinder_project/data/repository/api_response.dart';
import 'package:pathfinder_project/data/repository/critical_repository/critial_effects_repository.dart';
import 'package:pathfinder_project/data/repository/url_manager.dart';

class CriticalEffectsRepositoryImpl implements CriticalEffectsRepository {

  final ApiManager apiManager = ApiManager();



  @override
  Future<ApiResponse<EffectsModel>> getCriticalEffectById(String type, int id) async {

    final String url = '${UrlManager.baseUrlCriticalEffect}${type.replaceAll(' ', '')}/$id';

    Response response = await apiManager.callService(type: HttpMethodType.GET, url: url, validateSession: false);
    if(response.statusCode == 200) {
      final utfJson = const Utf8Decoder().convert(response.body.codeUnits);
      final jsonData = json.decode(utfJson);
      final successData = EffectsModel.fromMap(jsonData);
      return ApiResponse<EffectsModel>(error: false, successData: successData);
    }else{
      final result = ApiManager.handleErrorData(response);
      return ApiResponse<EffectsModel>(error: true, errorMessage: result.errorMessage);
    }
  }

}