import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'smart_restart_method_channel.dart';

abstract class SmartRestartPlatform extends PlatformInterface {
  SmartRestartPlatform() : super(token: _token);

  static final Object _token = Object();

  static SmartRestartPlatform _instance = MethodChannelSmartRestart();

  static SmartRestartPlatform get instance => _instance;

  static set instance(SmartRestartPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Platform contract: restart the app (Android clean relaunch; others no-op)
  Future<void> restart() {
    throw UnimplementedError('restart() has not been implemented.');
  }
}
