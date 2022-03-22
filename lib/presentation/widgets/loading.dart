import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pathfinder_project/core/helper/app_colors_helper.dart';
import 'package:pathfinder_project/core/helper/app_images_helper.dart';

class Loading extends StatelessWidget {
  final bool isLoading;
  const Loading({Key? key, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading ?  Center(
      child: SizedBox(
        height: 250,
        width: 250,
        child: Lottie.asset(AppImagesHelper.swordLoadingLottie, repeat: true),
      ),
    )
        : const SizedBox();
  }
}
