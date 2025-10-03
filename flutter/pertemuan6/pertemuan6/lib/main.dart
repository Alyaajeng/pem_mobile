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
        appBar: AppBar(
          title: Text("Belajar Scaffold & AppBar"),
          backgroundColor: Colors.teal,
          leading: const Icon(Icons.menu),
          actions: const [
            Icon(Icons.search),
            Icon(Icons.settings),
            // Icon(Icons.more_vert),
          ],
        ),
        body: const Center(child: Text("Hello, Alya Cantik")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ], 
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
        ),
      ),
    );
  }
}
