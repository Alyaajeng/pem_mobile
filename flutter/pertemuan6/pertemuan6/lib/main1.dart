import 'package:flutter/material.dart';

void main() {
  runApp(const sib3b());
}

class sib3b extends StatelessWidget {
  const sib3b({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.account_circle, size: 48, color: Colors.white),
              Text(
                'flutter Alya',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                'Subtitle',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              FlutterLogo(
                size: 48,
                style: FlutterLogoStyle.horizontal,
                textColor: Colors.white,
              ),
              Image.asset(
                'assets/images/polinema.jpg',
                width: 48,
                height: 48,
              ),
            ],
          ),
          backgroundColor: Colors.purple,
          // leading: const Icon(Icons.menu),
          actions: const [Icon(Icons.settings), Icon(Icons.search)],
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              // color: Colors.blue,
              // height: 200,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                // color: Colors.blue,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 23, 23, 23),
                    blurRadius: 7,
                    offset: const Offset(2, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('You have pushed the button this many times'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star_half, color: Colors.amber),
                      Icon(Icons.star_border, color: Colors.amber),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: const Text('Press Me', style: TextStyle(fontSize: 20)),
                  ),
                  TextButton(
                    onPressed: () {
                      print('Text Button Pressed');
                    }, 
                    child: const Text(
                      'Text Button', 
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    child: const Text(
                      'Press Me', 
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print('Icon Button Pressed');
                    },
                    icon: const Icon(Icons.favorite, color: Colors.pink),
                  ),
                ],
              ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'ini tombol',
          child: const Icon(Icons.add),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.purple),
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
