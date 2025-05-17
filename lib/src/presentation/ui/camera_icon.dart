import 'package:flutter/material.dart';

class CameraIcon extends StatelessWidget {
  late final Widget? centerWidget;

  CameraIcon({super.key, Widget? center}) {
    centerWidget = center;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      margin: const EdgeInsets.only(left: 5.0),
      child: CircleAvatar(
        radius: 60.0,
        backgroundColor: Colors.white,
        child: CircleAvatar(
            backgroundColor: Colors.lightBlue, child: centerWidget),
      ),
    );
  }
}
