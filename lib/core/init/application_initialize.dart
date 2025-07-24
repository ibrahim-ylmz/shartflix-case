import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
/// This class is used initialize the application process
final class ApplicationInitialize {
  /// Project basic required initialize
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initialize();
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
