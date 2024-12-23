import 'package:flutter/material.dart';
import 'package:siska_fe/screens/form/form_page.dart';
import 'package:siska_fe/screens/home_page.dart';
import 'package:siska_fe/screens/setting/setting_page.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    FormPage(),
    SettingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonWidth = (screenWidth - 40) / 3;

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: _selectedIndex * buttonWidth,
              child: Container(
                width: buttonWidth,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF24B351),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_selectedIndex != 0) _onItemTapped(0);
                  },
                  child: SizedBox(
                    width: buttonWidth,
                    height: buttonWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: 24,
                          color:
                              _selectedIndex == 0 ? Colors.white : Colors.black,
                        ),
                        if (_selectedIndex == 0) ...[
                          const SizedBox(width: 8),
                          const Text(
                            "Home",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_selectedIndex != 1) _onItemTapped(1);
                  },
                  child: SizedBox(
                    width: buttonWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.folder,
                          size: 24,
                          color:
                              _selectedIndex == 1 ? Colors.white : Colors.black,
                        ),
                        if (_selectedIndex == 1) ...[
                          const SizedBox(width: 8),
                          const Text(
                            "Temuan",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_selectedIndex != 2) _onItemTapped(2);
                  },
                  child: SizedBox(
                    width: buttonWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          size: 24,
                          color:
                              _selectedIndex == 2 ? Colors.white : Colors.black,
                        ),
                        if (_selectedIndex == 2) ...[
                          const SizedBox(width: 8),
                          const Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
