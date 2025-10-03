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
            Icon(Icons.more_vert),
          ],
        ),
        body: const Center(child: Text("Hello, Alya Cantik")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
