import 'package:flutter/material.dart';
import 'package:responsi_123200146/pages/homepage.dart';

// Nama : Faqi Himmaka Mushoffa
// NIM 12320014

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepage(),
    );
  }
}
