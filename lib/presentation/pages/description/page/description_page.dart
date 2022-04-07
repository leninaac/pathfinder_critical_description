import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pathfinder_project/core/helper/app_style_helper.dart';
import 'package:pathfinder_project/presentation/pages/description/stores/description_store.dart';
import 'package:pathfinder_project/presentation/widgets/background_widget.dart';
import 'package:pathfinder_project/presentation/widgets/loading.dart';

import '../../../../core/helper/app_images_helper.dart';

class DescriptionPage extends StatelessWidget {
  final String? effectType;

  DescriptionPage({Key? key, required this.effectType}) : super(key: key);

  final _descriptionStore = DescriptionStore();

  @override
  Widget build(BuildContext context) {

    _descriptionStore.effectType = effectType!;
    _descriptionStore.fillDescriptionPage(effectType!);

    return Scaffold(
      body: BackgroundWidget(
        image: AppImagesHelper.criticalBackground,
        child: SafeArea(
          child: Stack(children: [
            Column(
              children: [
                Stack(
                  children: [
                    Observer(builder: (_) => Container(
                      height: MediaQuery.of(context).size.height / 2.8,
                      width: MediaQuery.of(context).size.width,
                      decoration: AppStyleHelper.descriptionTitleDecoration(_descriptionStore.effectTypeBackground.replaceAll(' ', '')),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Observer(builder: (_) => AutoSizeText(
                                    _descriptionStore.effectType,
                                    textAlign: TextAlign.end,
                                    maxLines: 1,
                                    style: AppStyleHelper.descriptionEffectName(),
                                  )),
                                )
                                ,
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Image.asset(
                                    AppImagesHelper.underlineTextDetail,
                                    width: MediaQuery.of(context).size.width / 3,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                    Observer(builder: (_) => Image.asset(_descriptionStore.effectTypeBanner,
                        height: MediaQuery.of(context).size.height / 2.3)),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  child: Observer(builder: (_) => AutoSizeText(_descriptionStore.effectTitle,
                      textAlign: TextAlign.center,
                      style: AppStyleHelper.descriptionTitle())),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
                  child: Column(
                    children: [
                      Image.asset(AppImagesHelper.upEffectDescriptionDetail,
                          width: MediaQuery.of(context).size.width / 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Observer(builder: (_) => Text(
                          _descriptionStore.effectDescription,
                          textAlign: TextAlign.center,
                          style: AppStyleHelper.descriptionEffect(),
                        )),
                      ),
                      Image.asset(AppImagesHelper.downEffectDescriptionDetail,
                          width: MediaQuery.of(context).size.width / 2),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width /3,
                                decoration: AppStyleHelper.enterButtonDecoration(),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: AutoSizeText(
                                    'Voltar',
                                    textAlign: TextAlign.center,
                                    style: AppStyleHelper.homeTitleTextStyle(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Observer(builder: (_) => Loading(isLoading: _descriptionStore.isLoading))
          ]
          ),
        ),
      ),
    );
  }
}
