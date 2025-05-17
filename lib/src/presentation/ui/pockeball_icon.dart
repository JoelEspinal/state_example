import 'package:flutter/material.dart';

class PockeballIcon extends StatelessWidget {
  const PockeballIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://user-images.githubusercontent.com/9741252/81717987-83b84000-947b-11ea-9ac9-5ad1d59adf7a.png',
      width: 50.0,
      height: 50.0,
    );
  }
}
