import 'package:flutter/material.dart';
import 'package:siska_fe/layout/main_layout.dart';
import 'package:siska_fe/screens/form/form_page.dart';
import 'package:siska_fe/screens/home_page.dart';
import 'package:siska_fe/screens/intro/login_page.dart';
import 'package:siska_fe/screens/intro/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
        home: MainLayout());
  }
}
