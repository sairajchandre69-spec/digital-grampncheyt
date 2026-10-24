import 'dart:async';

import 'package:flutter/foundation.dart';

class SplashController {
  SplashController({
    this.duration = const Duration(seconds: 5),
  });

  final Duration duration;
  Timer? _timer;

  void start({required VoidCallback onComplete}) {
    if (_timer != null) {
      return;
    }

    _timer = Timer(duration, () {
      _timer = null;
      onComplete();
    });
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}