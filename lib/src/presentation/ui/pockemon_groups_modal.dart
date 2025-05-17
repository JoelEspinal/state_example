import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'camera_icon.dart';
import 'pockemon_group_icon.dart';

class PockemonGroupsModal extends ConsumerWidget {
  const PockemonGroupsModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
        toolbarHeight: 100.0,
        leading: CameraIcon(
          center: const PockemonGroupIcon(),
        ),
        backgroundColor: Colors.blue.shade400,
      ),
    );
  }
}
