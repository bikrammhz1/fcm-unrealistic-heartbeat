import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fcm_unrealistic_heartbeat/fcm_unrealistic_heartbeat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _fcm = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String fcm;
    try {
      fcm =
          await FcmUnrealisticHeartbeat.init ?? 'Unknown platform version';
    } on PlatformException {
      fcm = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _fcm = fcm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running : $_fcm\n'),
        ),
      ),
    );
  }
}
