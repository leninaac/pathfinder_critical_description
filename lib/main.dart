import 'package:flutter/material.dart';
import 'package:pathfinder_project/presentation/pages/login/login_page.dart';

import 'core/helper/app_route_helper.dart';

void main() {
  runApp( MaterialApp(
    home: LoginPage(),
    initialRoute: '/',
    onGenerateRoute: AppRouteHelper.generateRoute,
    debugShowCheckedModeBanner: false,
  ));
}
