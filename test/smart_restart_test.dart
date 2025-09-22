import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:smart_restart/smart_restart.dart';
import 'package:smart_restart/smart_restart_platform_interface.dart';

class _MockRestartPlatform extends SmartRestartPlatform
    with MockPlatformInterfaceMixin {
  bool called = false;

  @override
  Future<void> restart() async {
    called = true;
  }
}

void main() {
  test('SmartRestart.restart delegates to platform instance', () async {
    final mock = _MockRestartPlatform();
    SmartRestartPlatform.instance = mock;

    await SmartRestart.restart();

    expect(mock.called, isTrue);
  });
}
