import 'package:flutter/material.dart';

import '../../core/helper/app_colors_helper.dart';


class EffectTypeButton extends StatelessWidget {

  final String image;
  final String title;


  EffectTypeButton({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(image, width: 95, height: 95)),
        Expanded(
          child: Text(title,
              style: const TextStyle(
                  fontFamily: "Jubilee",
                  fontSize: 22,
                  color: AppColorsHelper.criticalColorBrown,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}