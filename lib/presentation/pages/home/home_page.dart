import 'package:flutter/material.dart';
import 'package:pathfinder_project/presentation/widgets/background_widget.dart';

import '../../../core/helper/app_images_helper.dart';
import '../../../core/helper/app_route_helper.dart';
import '../../../core/helper/app_style_helper.dart';
import '../../widgets/effect_type_button.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
        child: Column(
          children: [
            Image.asset(AppImagesHelper.tornBanner),
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImagesHelper.titleBackground))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
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
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 32),
                  itemCount: _effectsTypes.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRouteHelper.routeDescription,
                            arguments:
                                _effectsTypes[index]['title']?.toUpperCase());
                      },
                      child: EffectTypeButton(
                          title: _effectsTypes[index]['title'] ?? '',
                          image: _effectsTypes[index]['image'] ?? ''),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
