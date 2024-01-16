import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tzdata;

import 'homePage.dart';

void main() async {
  tzdata.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(useMaterial3: true),
        title: 'দিন, সময়, এবং তারিখ',
        debugShowCheckedModeBanner: false,
        home: const HomPage());
  }
}
