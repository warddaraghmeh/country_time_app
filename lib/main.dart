// ignore_for_file: prefer_const_constructors

import 'package:country_time_app/pages/home.dart';
import 'package:country_time_app/pages/location.dart';
import 'package:country_time_app/pages/Loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: '/',

      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const Location(),
      },
    );
  }
}

class WorldTimeApp extends StatefulWidget {
  const WorldTimeApp({super.key});

  @override
  State<WorldTimeApp> createState() => _WorldTimeAppState();
}

class _WorldTimeAppState extends State<WorldTimeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(""),
    );
  }
}
