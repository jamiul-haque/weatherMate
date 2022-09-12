import 'package:flutter/material.dart';
import 'package:weather_app/page/get_stated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "weather app",
      home: GetStated(),
    );
  }
}
