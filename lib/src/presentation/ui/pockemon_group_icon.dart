import 'package:flutter/material.dart';

class PockemonGroupIcon extends StatelessWidget {
  const PockemonGroupIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/pockemon_group.png',
      width: 50.0,
      height: 50.0,
    );
  }
}
