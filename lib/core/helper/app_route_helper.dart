import 'package:flutter/material.dart';

import '../../presentation/pages/description/page/description_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/login/login_page.dart';

class AppRouteHelper {

  static const routeHome = "/home";
  static const routeLogin = "/login";
  static const routeDescription = "/description";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments.toString();
    switch(settings.name) {
      
      case "/" : return MaterialPageRoute(builder: (_) => LoginPage());
      case "/login" : return MaterialPageRoute(builder: (_) => LoginPage());
      case "/home" : return MaterialPageRoute(builder: (_) => HomePage());
      case "/description" : return MaterialPageRoute(builder: (_) => DescriptionPage(effectType: args));
      default : return _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Tela não encontrada"),
        ),
        body: const Center(
          child: Text("Tela não encontrada"),
        ),
      );
    });
  }
  
}