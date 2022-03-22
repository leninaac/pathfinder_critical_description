import 'package:flutter/material.dart';


class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final String image;

  const BackgroundWidget({
    Key? key,
    required this.child,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill
          ),

      ),
    );
  }
}
