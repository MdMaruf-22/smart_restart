import 'package:smart_restart/smart_restart_platform_interface.dart';

/// Public API: call [SmartRestart.restart()] to relaunch the app on Android.
/// No host-app setup needed. Non-Android platforms: no-op (for now).
class SmartRestart {
  static Future<void> restart() {
    return SmartRestartPlatform.instance.restart();
  }
}
