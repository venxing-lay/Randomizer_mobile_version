import 'dart:io';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/randomPicker.dart';
import 'screens/yesOrNo.dart';
import 'screens/customList.dart';
import 'screens/teamGenerator.dart';
import 'screens/namePicker.dart';
import 'screens/decisionMaker.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Randomizer',
      initialRoute: '/',
      routes: {
        '/randompicker': (context) => RandomizerPicker(1),
        '/customlist': (context) => CustomList(2),
        '/decision': (context) => DecisionMaker(3),
        '/namepicker': (context) => NamePicker(4),
        '/teamgenerator': (context) => TeamGenerator(5),
        '/yesorno': (context) => YesOrNo(5),
      },
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF0A0E31),
        scaffoldBackgroundColor: Color(0xFFe5e5e5),
      ),
      home: HomeScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
