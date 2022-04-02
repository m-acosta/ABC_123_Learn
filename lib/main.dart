import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABC 123 Learn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Normal Entry Point for App
      home: Splash(title: 'Splash'),
      // Skip Splash for Developers
      // home: MyHomePage(title: 'Home Page'),
    );
  }
}

