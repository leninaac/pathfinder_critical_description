import 'package:flutter/material.dart';
import 'package:pathfinder_project/core/helper/app_images_helper.dart';
import 'package:pathfinder_project/core/helper/app_route_helper.dart';
import 'package:pathfinder_project/presentation/widgets/attack_type_button.dart';
import 'package:pathfinder_project/presentation/widgets/background_widget.dart';

import '../../../core/helper/app_style_helper.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _attackTypes = [
    {
      "title" : "Critical Effect" , "image" : AppImagesHelper.criticalSwordIcon, 'destination' : AppRouteHelper.routeCriticalHome},
    {"title" : "Fumble Effect" , "image" : AppImagesHelper.fumbleSwordIcon, 'destination' : ""},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        image: AppImagesHelper.standardBackground,
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImagesHelper.pathfinderLogo),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                        'CRITICAL AND FUMBLE HIT DECK',
                        style: AppStyleHelper.titleTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, _attackTypes[0]['destination'] ?? '');
                        },
                        child: AttackTypeButton(
                            image: _attackTypes[0]['image'] ?? '',
                            title: _attackTypes[0]['title'] ?? ''),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, _attackTypes[1]['destination'] ?? '');
                        },
                        child: AttackTypeButton(
                            image: _attackTypes[1]['image'] ?? '',
                            title: _attackTypes[1]['title'] ?? ''),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
