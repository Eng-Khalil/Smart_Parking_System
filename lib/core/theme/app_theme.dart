import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:our_app/core/utils/constants.dart';
// import 'package:our_app/presentation/screens/login_screen.dart';
// import 'package:our_app/presentation/screens/onboarding_screen.dart';
// import 'package:our_app/presentation/screens/welcome_screen.dart';
// import 'package:our_app/presentation/screens/admin_screen.dart';
import 'package:our_app/main.dart';
import 'package:provider/provider.dart';

void main(dynamic DefaultFirebaseOptions) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppTheme(), // Initialize AppTheme
      child: const MyApp(),
    ),
  );
}

final class AppThemeBase extends ChangeNotifier {
  get themeMode => null;

  get useDarkGradient => null;

  void toggleDarkGradient(bool value) {}

  void setThemeMode(ThemeMode dark) {}

  static getGradient(bool isDark, useDarkGradient) {}
}

bool _isDarkMode = false;

bool get isDarkMode => _isDarkMode;

void toggleTheme() {
  _isDarkMode = !_isDarkMode;
  notifyListeners();
}

void notifyListeners() {}

enum ThemeModeOption { light, dark, system }

class AppTheme extends ChangeNotifier {
  ThemeModeOption _themeMode = ThemeModeOption.system;
  bool _useDarkGradient = false;

  ThemeModeOption get themeMode => _themeMode;
  bool get useDarkGradient => _useDarkGradient;

  void setThemeMode(ThemeModeOption mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void toggleDarkGradient(bool value) {
    _useDarkGradient = value;
    notifyListeners();
  }

  static LinearGradient getGradient(bool isDark, bool useDarkGradient) {
    if (isDark || useDarkGradient) {
      return const LinearGradient(
        colors: [Colors.black54, Colors.black87],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    } else {
      return const LinearGradient(
        colors: [Colors.blueGrey, Colors.lightBlue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    }
  }
}
