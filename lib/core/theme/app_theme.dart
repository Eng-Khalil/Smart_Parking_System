import 'package:provider/provider.dart';
import 'package:smart_parking_app/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppTheme(), // Initialize AppTheme
      child: const MyApp(),
    ),
  );
}
