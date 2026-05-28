import 'package:flutter/material.dart';
import 'package:lift_app/core/theme/app_theme.dart';
import 'package:lift_app/features/exercises/screens/home_content.dart';
import 'package:lift_app/features/exercises/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final screens = [const HomeContent(), const ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: screens[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },

        backgroundColor: const Color(0xFF111111),

        selectedItemColor: AppColors.primary,

        unselectedItemColor: Colors.white54,

        type: BottomNavigationBarType.fixed,

        elevation: 0,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),

            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),

            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
