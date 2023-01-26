import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/constants/color_schemes.g.dart';
import 'package:orderje/firebase_options.dart';
import 'package:orderje/screens/auth/login_screen.dart';
import 'package:orderje/screens/auth/signup_screen.dart';
import 'package:orderje/screens/getstarted_screen.dart';
import 'package:orderje/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());

  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> _sub;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    _sub = FirebaseAuth.instance.userChanges().listen((user) {
      _navigatorKey.currentState!.pushReplacementNamed(
        user != null ? '/home' : '/',
      );
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'OrderJe',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
        fontFamily: 'GeneralSans',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(elevation: MaterialStateProperty.all(0))
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const GetStartedScreen(),
        '/auth/login': (context) => const LoginScreen(),
        '/auth/register': (context) => const SignupScreen(),
        '/home': (context) => const MainScreen()
      },
      // home: const GetStartedScreen()
    );
  }
}
