import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_project/presentation/widgets/background_widget.dart';

import '../../../core/helper/app_images_helper.dart';
import '../../../core/helper/app_route_helper.dart';
import '../../../core/helper/app_style_helper.dart';
import '../../widgets/critical_effect_type_button.dart';

class CriticalHomePage extends StatelessWidget {
  CriticalHomePage({Key? key}) : super(key: key);

  final _effectsTypes = [
    {"title": 'Bludgeoning', "image": AppImagesHelper.bludgeoningIcon},
    {"title": 'Piercing', "image": AppImagesHelper.piercingIcon},
    {"title": 'Slashing', "image": AppImagesHelper.slashingIcon},
    {"title": 'Bomb or Spell', "image": AppImagesHelper.bombSpellIcon}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        image: AppImagesHelper.standardBackground,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 350,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImagesHelper.tornBanner),
                        fit: BoxFit.fill
                    ),
                  ),
              ),
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImagesHelper.titleBackground))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                  child: Text('select your critical attack type',
                      textAlign: TextAlign.center,
                      style: AppStyleHelper.homeTitleTextStyle()),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: _effectsTypes.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRouteHelper.routeDescription,
                              arguments:
                                  _effectsTypes[index]['title']?.toUpperCase());
                        },
                        child: CriticalEffectTypeButton(
                            title: _effectsTypes[index]['title'] ?? '',
                            image: _effectsTypes[index]['image'] ?? ''),
                      );
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width /3,
                        decoration: AppStyleHelper.attackTypeButtonDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: AutoSizeText(
                            'Voltar',
                            textAlign: TextAlign.center,
                            style: AppStyleHelper.buttonTypeEffectTextStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
