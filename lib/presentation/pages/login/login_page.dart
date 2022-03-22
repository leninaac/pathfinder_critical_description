import 'package:flutter/material.dart';

import '../../../core/helper/app_images_helper.dart';
import '../../../core/helper/app_route_helper.dart';
import '../../../core/helper/app_style_helper.dart';
import '../../widgets/background_widget.dart';
import '../../widgets/login_text_field.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        image: AppImagesHelper.standardBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImagesHelper.pathfinderLogo),
              Text('CRITICAL HIT DECK', style: AppStyleHelper.titleTextStyle()),
              const SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Login', style: AppStyleHelper.loginTextStyle()),
              ),
              LoginTextField(controller: _userController, hintText: 'Usuário'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Senha', style: AppStyleHelper.loginTextStyle()),
              ),
              LoginTextField(controller: _passwordController, hintText: 'Senha'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRouteHelper.routeHome);
                  },
                  child: Container(
                    decoration: AppStyleHelper.enterButtonDecoration(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      child: Text('Entrar', style: AppStyleHelper.loginTextStyle()),
                    ),
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


