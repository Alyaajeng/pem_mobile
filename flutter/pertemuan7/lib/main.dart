import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main(){
  final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomePage()),
      GoRoute(path: '/about', builder: (context, state) => AboutPage()),
    ],
  );
  runApp(
    MaterialApp.router(
      routerConfig: router,
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Router Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => context.go('/about'),
            child: Text('Ke Halaman About'),  
          )
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Profil'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Kembali ke Home Page'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
    );
  }
}