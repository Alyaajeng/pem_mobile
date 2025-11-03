import 'package:flutter/material.dart';

void main() {
  runApp(StylingExample());
}

class StylingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Styling and Positioning'),
        ),
        body: Stack(
          children: [
            Container(color: Colors.lightBlueAccent),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blue,
                child: Text(
                  'Tengah Layar',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}