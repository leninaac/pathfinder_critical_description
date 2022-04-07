
import 'package:flutter/material.dart';

import 'app_colors_helper.dart';
import 'app_images_helper.dart';

class AppStyleHelper {

  static TextStyle titleTextStyle() {
    return const TextStyle(
        fontFamily: 'Taroca',
        fontSize: 24);
  }

  static TextStyle buttonTypeEffectTextStyle() {
    return const TextStyle(
        fontFamily: 'Taroca',
        color: AppColorsHelper.criticalColorYellow,
        fontSize: 24);
  }

  static homeTitleTextStyle() {
    return const TextStyle(
      color: AppColorsHelper.criticalColorRed,
      fontFamily: 'Taroca',
      fontSize: 24);
  }

  static TextStyle loginTextStyle() {
    return const TextStyle(
      fontFamily: 'Jubilee',
      fontSize: 28,
      fontWeight: FontWeight.bold);
  }

  static TextStyle descriptionTitle(){
    return const TextStyle(
        fontFamily: 'Jubilee',
        color: AppColorsHelper.criticalColorOrange,
        fontSize: 50);
  }

  static TextStyle descriptionEffectName(){
    return const TextStyle(
        fontFamily: 'Jubilee',
        fontWeight: FontWeight.bold,
        color: AppColorsHelper.criticalColorRed,
        fontSize: 50);
  }

  static TextStyle descriptionEffect() {
    return const TextStyle(
        fontFamily: 'Jubilee',
        fontSize: 24,
        color: Colors.white
    );
  }

  static BoxDecoration enterButtonDecoration(){
    return const BoxDecoration(
      boxShadow: [
        BoxShadow(color: Colors.transparent, offset: Offset(0.0, 1.0))
      ],
      image: DecorationImage(
          image: AssetImage(AppImagesHelper.buttonScrollYellowLayout),
          fit: BoxFit.fill
      ),
    );
  }

  static BoxDecoration attackTypeButtonDecoration(){
    return const BoxDecoration(
      boxShadow: [
        BoxShadow(color: Colors.transparent, offset: Offset(0.0, 1.0))
      ],
      image: DecorationImage(
          image: AssetImage(AppImagesHelper.buttonScrollRedLayout),
          fit: BoxFit.fill
      ),
    );
  }

  static BoxDecoration descriptionTitleDecoration(String imagePath) {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage(imagePath))
    );
  }


}