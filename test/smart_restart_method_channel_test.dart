import 'package:flutter_test/flutter_test.dart';
import 'package:smart_restart/smart_restart_method_channel.dart';
import 'package:smart_restart/smart_restart_platform_interface.dart';

void main() {
  test('default instance is MethodChannelSmartRestart', () {
    expect(SmartRestartPlatform.instance, isA<MethodChannelSmartRestart>());
  });
}
