import 'package:flutter/material.dart';

void main() {
  runApp(AlyaApp());
}

class AlyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AlyaApp",
      home: Scaffold(
        appBar: AppBar(title: Text("Column & Row Example")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Atas"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Colors.red, size: 40),
                  Icon(Icons.star, color: Colors.green, size: 40),
                  Icon(Icons.star, color: Colors.blue, size: 40),
                ],
              ),
              const Text("Bawah"),
              Container(
                margin: const EdgeInsets.all(20), // jarak luar
                padding: const EdgeInsets.all(10), // jarak dalam
                color: Colors.blue,
                child: const Text(
                  "Dengan Margin & Padding",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(leading: Icon(Icons.message), title: Text('Messages')),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
          ],
        ),
      ),
    );
  }
}
