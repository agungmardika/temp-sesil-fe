import 'package:flutter/material.dart';
import 'package:siska_fe/screen/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
        home: LoginPage());
  }
}
