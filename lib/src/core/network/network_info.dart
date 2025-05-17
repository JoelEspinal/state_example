import 'dart:io';

class NetworkInfo {
  NetworkInfo._privateConstructor() {}

  static NetworkInfo _instance = NetworkInfo._privateConstructor();

  static NetworkInfo get instance => _instance;

  Future<NetworkInfo> initNetworkInfo() async {
    _instance ??= await NetworkInfo._privateConstructor();
    return _instance;
  }

  Future<bool> isConnected() async {
    var hasConnection = false;
    final result = await InternetAddress.lookup('google.com')
        .timeout(const Duration(seconds: 1, microseconds: 50), onTimeout: () {
      hasConnection = false;
      return Future.value(<InternetAddress>[]);
    }).catchError((_) {
      hasConnection = false;
      return Future.value(<InternetAddress>[]);
    }).onError((_, __) {
      hasConnection = false;
      return Future.value(<InternetAddress>[]);
    });

    hasConnection = (result.isNotEmpty && result[0].rawAddress.isNotEmpty);

    return Future.value(hasConnection);
  }
}
