
import 'package:flutter/material.dart';

import '../../core/helper/app_images_helper.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool? enable;
  final String? errorMessage;

  const LoginTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.enable,
    this.errorMessage = 'Login incorreto'})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImagesHelper.textFormFieldLayout),
            fit: BoxFit.fill
        ),

      ),
      child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextFormField(
            obscureText: false,
            maxLines: 1,
            controller: controller,
            keyboardType: TextInputType.number,
            enableSuggestions: false,
            enabled: enable,
            autocorrect: false,
          ),
        )

    );
  }
}
