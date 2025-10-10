import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'counter_page.dart';

void main() {
  runApp(MyProfileCounterApp());
}

class MyProfileCounterApp extends StatefulWidget {
  @override
  _MyProfileCounterAppState createState() => _MyProfileCounterAppState();
}

class _MyProfileCounterAppState extends State<MyProfileCounterApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ProfilePage(),
    CounterPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile & Counter App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
            BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Counter'),
          ],
          onTap: (index) {
            setState(() => _selectedIndex = index);
          },
        ),
      ),
    );
  }
}
