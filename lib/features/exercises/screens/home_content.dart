import 'package:flutter/material.dart';
import 'package:lift_app/core/theme/app_theme.dart';
import 'package:lift_app/features/exercises/screens/muscle_screen.dart/exercise.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  Widget muscleCard({
    required BuildContext context,
    required String text,
    required Color color1,
    required Color color2,
    required IconData icon,
    required Widget screen,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },

      child: Container(
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          borderRadius: BorderRadius.circular(24),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Icon(icon, color: Colors.white, size: 38),

            const Spacer(),

            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 20),

              Text(
                'Welcome Back!',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                'What are we training today?',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 24),

              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.15,
                  ),

                  children: [
                    muscleCard(
                      context: context,
                      text: 'Chest',
                      color1: const Color(0xFFFF7B72),
                      color2: const Color(0xFFFF3B30),
                      icon: Icons.favorite,
                      screen: const ExerciseScreen(bodyPart: 'chest'),
                    ),

                    muscleCard(
                      context: context,
                      text: 'Back',
                      color1: const Color(0xFF5EE173),
                      color2: const Color(0xFF1DB954),
                      icon: Icons.shield,
                      screen: const ExerciseScreen(bodyPart: 'back'),
                    ),

                    muscleCard(
                      context: context,
                      text: 'Shoulders',
                      color1: const Color(0xFF7A7AFF),
                      color2: const Color(0xFF4B4BFF),
                      icon: Icons.accessibility_new,
                      screen: const ExerciseScreen(bodyPart: 'shoulders'),
                    ),

                    muscleCard(
                      context: context,
                      text: 'Arms',
                      color1: const Color(0xFFFF9F5A),
                      color2: const Color(0xFFFF6A00),
                      icon: Icons.fitness_center,
                      screen: const ExerciseScreen(bodyPart: 'upper arms'),
                    ),

                    muscleCard(
                      context: context,
                      text: 'Legs',
                      color1: const Color(0xFFFFD95A),
                      color2: const Color(0xFFFFB800),
                      icon: Icons.directions_run,
                      screen: const ExerciseScreen(bodyPart: 'upper legs'),
                    ),

                    muscleCard(
                      context: context,
                      text: 'Neck',
                      color1: const Color(0xFFA66BFF),
                      color2: const Color(0xFF7B2EFF),
                      icon: Icons.airline_seat_legroom_normal,
                      screen: const ExerciseScreen(bodyPart: 'neck'),
                    ),

                    muscleCard(
                      context: context,
                      text: 'Core',
                      color1: const Color(0xFF26C6DA),
                      color2: const Color(0xFF00838F),
                      icon: Icons.radio_button_checked,
                      screen: const ExerciseScreen(bodyPart: 'waist'),
                    ),

                    muscleCard(
                      context: context,
                      text: 'Cardio',
                      color1: const Color(0xFF66BB6A),
                      color2: const Color(0xFF2E7D32),
                      icon: Icons.favorite_border,
                      screen: const ExerciseScreen(bodyPart: 'cardio'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
