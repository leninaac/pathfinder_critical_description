import 'package:flutter/material.dart';
import 'package:pathfinder_project/core/anims/scale_page_route_anim.dart';
import 'package:pathfinder_project/core/anims/slide_page_route_anim.dart';

import '../../presentation/pages/critical_home/critical_home_page.dart';
import '../../presentation/pages/description/page/description_page.dart';
import '../../presentation/pages/home/home_Page.dart';
import '../../presentation/pages/login/login_page.dart';

class AppRouteHelper {

  static const routeLogin = "/login";
  static const routeHome = "/home";
  static const routeCriticalHome = "/criticalHome";
  static const routeDescription = "/description";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments.toString();
    switch(settings.name) {
      
      case "/" : return MaterialPageRoute(builder: (_) => LoginPage());
      case "/login" : return MaterialPageRoute(builder: (_) => LoginPage());
      case "/criticalHome" : return SlidePageRoute(child: CriticalHomePage(), direction: AxisDirection.left);
      case "/home" : return SlidePageRoute(child: HomePage(), direction: AxisDirection.left);
      case "/description" : return ScalePageRouteAnim(child: DescriptionPage(effectType: args)) ;
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