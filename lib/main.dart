import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/core/network/network_info.dart';
import 'src/core/pockedex_wraper.dart';
import 'src/init/app.dart';

void main() {
  NetworkInfo.instance.initNetworkInfo();
  PockedexWraper.instance;
  runApp(
    const ProviderScope(
      child: MyPokedex(),
    ),
  );
}
