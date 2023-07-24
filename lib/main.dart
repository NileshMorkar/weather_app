import 'package:flutter/material.dart';
import 'package:weather_app/Activity/home_page.dart';
import 'package:weather_app/Activity/loading_page.dart';
import 'package:weather_app/Activity/location_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/":(context)=>LoadingPage("Nashik"),
        "/home":(context)=>const HomePage(),
        "/loading":(context)=>LoadingPage("Pune"),
      },
    );
  }
}
