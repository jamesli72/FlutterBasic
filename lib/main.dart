import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:garden_iot/firebase_options.dart';
import 'package:garden_iot/pages/alert_config.dart';
import 'package:garden_iot/pages/alert_page.dart';
import 'package:garden_iot/pages/auth_page.dart';
import 'package:garden_iot/pages/create_note_page.dart';
import 'package:garden_iot/pages/mode_config_page.dart';
import 'package:garden_iot/pages/mode_page.dart';
import 'package:garden_iot/pages/navigation_page.dart';
import 'package:garden_iot/pages/photo_page.dart';
import 'package:garden_iot/pages/welcome_page.dart';
import 'package:garden_iot/styles/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garden IoT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthPage(),
        '/welcome': (context) => const WelcomePage(),
        '/home': (context) => MyHomePage(),
        '/picture_page': (context) => const PhotoPage(),
        '/mode_page': (context) => ModePage(),
        '/mode_page_config': (context) => const ModeConfig(),
        '/threshold_page': (context) => AlertPage(),
        '/threshold_page_config': (context) => const AlertConfig(),
        '/create_note_page': (context) => const CreateNotePage(),
      },
    );
  }
}
