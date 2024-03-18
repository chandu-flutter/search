import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:thandri_sannidhi/firebase_options.dart';

import 'package:thandri_sannidhi/pages/splash.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.Debug.setAlertLevel(OSLogLevel.none);

  // NOTE: Replace with your own app ID from https://www.onesignal.com
  OneSignal.initialize("5e3e8968-0e50-4f57-8960-8c0aa731891f");

  OneSignal.Notifications.requestPermission(true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
