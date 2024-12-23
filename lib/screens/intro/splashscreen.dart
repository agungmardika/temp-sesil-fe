import 'package:flutter/material.dart';
import 'dart:async';

import 'package:siska_fe/screens/intro/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentScreen =
      0; // 0: Blank, 1: SesilScreen, 2: TAJScreen, 3: SesilScreen2, 4: LoginPage
  double opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startSequence();
  }

  void _startSequence() async {
    // Blank screen delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Fade in SesilScreen
    setState(() {
      currentScreen = 1;
    });
    await Future.delayed(const Duration(milliseconds: 300)); // Smooth ease-in
    setState(() {
      opacity = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 2000));

    // Fade out SesilScreen, transition to TAJScreen
    setState(() {
      opacity = 0.0;
    });
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      currentScreen = 2;
      opacity = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 1200));

    // Fade out TAJScreen, transition to SesilScreen2
    setState(() {
      opacity = 0.0;
    });
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      currentScreen = 3;
      opacity = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 1200));

    // Fade out SesilScreen2, transition to LoginPage
    setState(() {
      opacity = 0.0;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      currentScreen = 4;
      opacity = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 1200),
        child: _getCurrentScreen(),
      ),
    );
  }

  Widget _getCurrentScreen() {
    switch (currentScreen) {
      case 1:
        return const SesilScreen();
      case 2:
        return const TAJScreen();
      case 3:
        return const SesilScreen2();
      case 4:
        return const LoginPage();
      default:
        return Container(); // Blank screen
    }
  }
}

class SesilScreen extends StatelessWidget {
  const SesilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo-sesil.png',
            fit: BoxFit.contain,
            width: 150,
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/sesil-text.png',
            fit: BoxFit.contain,
            width: 200,
          ),
          const SizedBox(height: 10),
          const Text(
            'Sistem Inspeksi Lingkungan Hidup',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              shadows: [
                Shadow(
                  offset: Offset(2.0, 4.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 171, 164, 164),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TAJScreen extends StatelessWidget {
  const TAJScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo-taj.png',
            fit: BoxFit.contain,
            width: 200,
          ),
          const SizedBox(height: 20),
          const Text(
            'Powered by PT Tanjung Alam Jaya',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class SesilScreen2 extends StatelessWidget {
  const SesilScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'assets/images/bg-login.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo-sesil.png',
                  fit: BoxFit.contain,
                  width: 150,
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/sesil-text.png',
                  fit: BoxFit.contain,
                  width: 200,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Sistem Inspeksi Lingkungan Hidup',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 4.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 171, 164, 164),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
