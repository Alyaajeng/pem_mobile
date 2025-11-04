import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'gallery_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());

      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());

      case '/gallery':
        return MaterialPageRoute(builder: (_) => GalleryPage());

      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
