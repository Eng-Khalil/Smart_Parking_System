// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'screens/welcome_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/admin_screen.dart';
// import 'screens/driver_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const ParkingApp());
// }

// class DefaultFirebaseOptions {
//   static var currentPlatform;
// }

// class ParkingApp extends StatelessWidget {
//   const ParkingApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Kampala Parking',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       initialRoute: '/admin',
//       routes: {
//         '/welcome': (context) => const WelcomeScreen(),
//         '/login': (context) => const LoginScreen(),
//         '/admin': (context) => const AdminScreen(),
//         '/driver': (context) => const DriverScreen(),
//       },
//     );
//   }
// }

import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/onboarding_screen.dart';
//import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class DefaultFirebaseOptions {
  static var currentPlatform;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Parking App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.welcome,
      routes: {
        AppRoutes.welcome: (context) => const OnboardingScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.home:
            (context) => const HomeScreen(), // Placeholder for home screen
      },
    );
  }
}

// Placeholder HomeScreen (create in lib/presentation/screens/home_screen.dart)
class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}
