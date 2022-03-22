
import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:pathfinder_project/core/helper/app_images_helper.dart';
import 'package:pathfinder_project/data/repository/critical_repository/critical_effects_repository_impl.dart';

part 'description_store.g.dart';

class DescriptionStore = _DescriptionStore with _$DescriptionStore;

abstract class _DescriptionStore with Store {

  final criticalEffectRepository = CriticalEffectsRepositoryImpl();

  @observable
  bool isLoading = false;

  @observable
  String effectType = '';

  @observable
  String effectTitle = '';

  @observable
  String effectDescription = '';

  @observable
  String effectTypeBanner = '';

  @observable
  String effectTypeBackground = '';

  fillDescriptionPage(String effect) async {
    isLoading = true;
    switch(effect.toLowerCase()) {
      case 'bludgeoning' : {
        effectTypeBanner = AppImagesHelper.bludgeoningBanner;
        effectTypeBackground = AppImagesHelper.bludgeoningTitle;
      }
      break;
      case 'slashing' : {
        effectTypeBanner = AppImagesHelper.slashingBanner;
        effectTypeBackground = AppImagesHelper.slashingTitle;
      }
      break;
      case 'piercing' : {
        effectTypeBanner = AppImagesHelper.piercingBanner;
        effectTypeBackground = AppImagesHelper.piercingTitle;
      }
      break;
      case 'bomb or spell' : {
        effectTypeBanner = AppImagesHelper.bombSpellBanner;
        effectTypeBackground = AppImagesHelper.bombSpellTitle;
      }
      break;
    }
    loadEffectByType(effect);
  }

  loadEffectByType(String effect) async {
    int randomNumber = Random().nextInt(53);
    final response = await criticalEffectRepository.getCriticalEffectById(effect.toLowerCase(), randomNumber);

    if(!response.error) {
      if(response.successData?.nome != null){
        effectTitle = response.successData?.nome ?? '';
      }
      if(response.successData?.descricao != null){
        effectDescription = response.successData?.descricao ?? '';
      }

    }
    isLoading = false;

  }


}