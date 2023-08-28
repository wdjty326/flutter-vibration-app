import 'package:flutter/material.dart';

class Init {
  static Future initialize() async {
    await _registerServices();
    await _loadSettings();
  }

  static _registerServices() async {
    debugPrint('starting registering services');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('finished registering services');
  }

  static _loadSettings() async {
    debugPrint('starting loading settings');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('finished loading settings');
  }
}
