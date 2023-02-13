import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orderje/constants/brand_color.dart';
import 'package:orderje/screens/nav_screens/home_screen.dart';
import 'package:orderje/screens/nav_screens/order_screen.dart';
import 'package:orderje/screens/nav_screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = [const HomeScreen(), const OrderScreen(), const ProfileScreen()];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      backgroundColor: const Color(0xffabe5bc),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        elevation: 0,
        enableFeedback: true,
        backgroundColor: OrderJeColors.mainColor,
        currentIndex: currentIndex,
        selectedItemColor: OrderJeColors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        // showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(fontSize: 10),
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bag), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
