import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fcm_unrealistic_heartbeat/fcm_unrealistic_heartbeat.dart';

void main() {
  const MethodChannel channel = MethodChannel('fcm_unrealistic_heartbeat');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FcmUnrealisticHeartbeat.platformVersion, '42');
  });
}
