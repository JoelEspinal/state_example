import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    moveToHome(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red.shade900,
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset('assets/images/closed_pockeball.png'),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Colors.red.shade900,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void moveToHome(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context, rootNavigator: true).pushNamed('/home_page');
    });
  }


}
