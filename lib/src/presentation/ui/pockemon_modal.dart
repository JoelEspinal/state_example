import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pockeball_icon.dart';

class PockemonCatchedModal extends ConsumerWidget {
  const PockemonCatchedModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cauched'),
        toolbarHeight: 100.0,
        leading: const PockeballIcon(),
        backgroundColor: Colors.red.shade700,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton.large(
        shape: const CircleBorder(),
        child: const Icon(
          Icons.exposure_plus_1_rounded,
          color: Colors.grey,
        ),
        onPressed: () {},
      ),
    );
  }
}
