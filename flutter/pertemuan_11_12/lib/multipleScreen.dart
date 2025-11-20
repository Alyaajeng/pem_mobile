import 'package:flutter/material.dart';

// DATA THEME
class AppTheme {
  bool isDarkMode = false;

  ThemeData get themeData {
    return isDarkMode
        ? ThemeData.dark()
        : ThemeData.light();
  }

  Color get backgroundColor {
    // Menggunakan Colors.grey[900]! untuk memastikan nilai bukan null, sesuai asumsi kode asli
    return isDarkMode ? Colors.grey[900]! : Colors.white;
  }

  Color get textColor {
    return isDarkMode ? Colors.white : Colors.black;
  }
}

typedef VoidCallback = void Function();

class ThemeInheritedWidget extends InheritedWidget {
  final AppTheme appTheme;
  final VoidCallback toggleTheme;

  const ThemeInheritedWidget({
    super.key,
    required this.appTheme,
    required this.toggleTheme,
    required Widget child,
  }) : super(child: child);

  static ThemeInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>();
  }

  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) {
    return appTheme.isDarkMode != oldWidget.appTheme.isDarkMode;
  }
}