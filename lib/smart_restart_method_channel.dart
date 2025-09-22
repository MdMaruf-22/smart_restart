import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'smart_restart_platform_interface.dart';

class MethodChannelSmartRestart extends SmartRestartPlatform {
  static const MethodChannel _channel = MethodChannel('smart_restart');

  @override
  Future<void> restart() async {
    if (!Platform.isAndroid) {
      // Non-Android platforms: do nothing (for now).
      return;
    }
    await _channel.invokeMethod<void>('restartClean');
  }
}
