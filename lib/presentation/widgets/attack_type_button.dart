import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_project/core/helper/app_style_helper.dart';

class AttackTypeButton extends StatelessWidget {
  final String image;
  final String title;

  const AttackTypeButton({Key? key, required this.image, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Image.asset(image, width: 150, height: 150),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: MediaQuery.of(context).size.width /3,
            decoration: AppStyleHelper.attackTypeButtonDecoration(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: AutoSizeText(
                title,
                textAlign: TextAlign.center,
                style: AppStyleHelper.buttonTypeEffectTextStyle(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
