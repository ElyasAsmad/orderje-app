import 'dart:io';

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
  runApp(const MyApp());

  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'OrderJe',
        theme: ThemeData(
          colorScheme: lightColorScheme,
          useMaterial3: true,
          fontFamily: 'GeneralSans',
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0)
            )
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontFamily: 'GeneralSans'),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
