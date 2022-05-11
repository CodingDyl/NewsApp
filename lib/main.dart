import 'package:flutter/material.dart';
import 'package:news_app/views/home.dart';

//api key cd87473495ed4fd585bbaccf6d8376b2

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const Home(),
    );
  }
}
