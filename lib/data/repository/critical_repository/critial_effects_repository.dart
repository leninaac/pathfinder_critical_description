import 'package:pathfinder_project/data/repository/api_response.dart';
import '../../models/effects_model.dart';

abstract class CriticalEffectsRepository {

  Future<ApiResponse<EffectsModel>> getCriticalEffectById(String type, int id);

}