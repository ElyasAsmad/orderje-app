import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get/get.dart';
import 'package:orderje/constants/color_schemes.g.dart';
import 'package:orderje/firebase_options.dart';
import 'package:orderje/screens/auth/login_screen.dart';
import 'package:orderje/screens/auth/signup_screen.dart';
import 'package:orderje/screens/getstarted_screen.dart';
import 'package:orderje/screens/main_screen.dart';
import 'package:orderje/screens/order_screens/order_food_screen.dart';
import 'package:orderje/screens/order_screens/payment_screen.dart';
import 'package:orderje/screens/order_screens/post_payment_screen.dart';

void main() async {

  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    debugPrint(e.toString());
  }

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
    return GetMaterialApp(
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
        '/home': (context) => const MainScreen(),
        '/order': (context) => const OrderFoodScreen(),
        '/payment': (context) => PaymentScreen(),
        '/payment/result': (context) => const PostPaymentScreen(),
      },
      // home: const GetStartedScreen()
    );
  }
}
