import 'package:flutter/material.dart';

import '../../core/helper/app_colors_helper.dart';


class CriticalEffectTypeButton extends StatelessWidget {

  final String image;
  final String title;


  const CriticalEffectTypeButton({Key? key, required this.image, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Image.asset(image, width: 85, height: 85)),
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