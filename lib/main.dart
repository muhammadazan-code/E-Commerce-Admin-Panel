import 'package:e_commerce_web/app.dart';
import 'package:e_commerce_web/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  /// Ensure the widget is initialize
  WidgetsFlutterBinding.ensureInitialized();
  // Remove # sign from URL
  setPathUrlStrategy();

  /// Initialize Firebase and Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // .then((value) => null);
  runApp(const MyApp());
}
