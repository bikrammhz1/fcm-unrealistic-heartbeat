
import 'dart:async';

import 'package:flutter/services.dart';

class FcmUnrealisticHeartbeat {
  static const MethodChannel _channel =
      const MethodChannel('fcm_unrealistic_heartbeat');

  static Future<String?> get init async {
    final String? version = await _channel.invokeMethod('getUnrealisticHeartbeat');
    return version;
  }
}
