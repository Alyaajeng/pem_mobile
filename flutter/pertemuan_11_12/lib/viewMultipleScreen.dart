import 'package:flutter/material.dart';
import 'multipleScreen.dart'; 

class ThemeApp extends StatefulWidget {
  const ThemeApp({super.key});

  @override
  _ThemeAppState createState() => _ThemeAppState();
}

class _ThemeAppState extends State<ThemeApp> {
  AppTheme appTheme = AppTheme();

  // Fungsi untuk mengubah mode gelap/terang dan memicu rebuild
  void toggleTheme() {
    setState(() {
      appTheme.isDarkMode = !appTheme.isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeInheritedWidget(
      appTheme: appTheme,
      toggleTheme: toggleTheme,
      child: MaterialApp(
        theme: appTheme.themeData,
        home: const FirstScreen(),
        routes: {
          '/second': (context) => const SecondScreen(),
        },
      ),
    );
  }
}

void main() {
  runApp(const ThemeApp());
}

// SCREEN PERTAMA
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeInherited = ThemeInheritedWidget.of(context);

    if (themeInherited == null) {
      return const Center(child: Text("Theme data not found!"));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
        actions: <Widget>[
          IconButton(
            icon: Icon(themeInherited.appTheme.isDarkMode == true
                  ? Icons.light_mode // jika Dark mode, tampilkan icon Terang
                  : Icons.dark_mode, // jika Light mode, tampilkan icon Gelap
            ),
            onPressed: themeInherited.toggleTheme, // Panggil fungsi toggle
          ),
        ],
      ),
      body: Container(
        color: themeInherited.appTheme.backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Screen Pertama',
                style: TextStyle(
                  fontSize: 24,
                  color: themeInherited.appTheme.textColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                themeInherited.appTheme.isDarkMode == true
                    ? 'Mode Terang' // teks saat Dark mode
                    : 'Mode Gelap', // teks saat Light mode
                style: TextStyle(
                  color: themeInherited.appTheme.textColor,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke SecondScreen
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text('Pergi ke Screen 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SCREEN KEDUA
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeInherited = ThemeInheritedWidget.of(context);

    if (themeInherited == null) {
      return const Center(child: Text("Theme data not found!"));
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              themeInherited.appTheme.isDarkMode == true
                  ? Icons.light_mode // Jika Dark mode, tampilkan icon Terang
                  : Icons.dark_mode, // Jika Light mode, tampilkan icon Gelap
            ),
            onPressed: themeInherited.toggleTheme, // Panggil fungsi toggle
          ),
        ],
      ),
      body: Container(
        color: themeInherited.appTheme.backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Screen Kedua',
                style: TextStyle(
                  fontSize: 24,
                  color: themeInherited.appTheme.textColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Theme sama di screen!',
                style: TextStyle(
                  color: themeInherited.appTheme.textColor,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}