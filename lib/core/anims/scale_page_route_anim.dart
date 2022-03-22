import 'package:flutter/material.dart';

class ScalePageRouteAnim extends PageRouteBuilder {
  final Widget child;

  ScalePageRouteAnim({
    required this.child,
    RouteSettings? settings,
  }) : super(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => child,
      settings: settings
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition(
        scale: animation,
        child: child,
      );
}