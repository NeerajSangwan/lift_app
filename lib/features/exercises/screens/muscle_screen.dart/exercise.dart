import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lift_app/core/theme/app_theme.dart';

import 'package:lift_app/features/exercises/bloc/exercise_bloc.dart';

import 'package:lift_app/features/exercises/models/exercise_model.dart';

import 'package:lift_app/features/exercises/screens/muscle_screen.dart/excersisedetailscreen.dart';

class ExerciseScreen extends StatefulWidget {
  final String bodyPart;

  const ExerciseScreen({super.key, required this.bodyPart});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  Widget infoChip({required String label, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            label,

            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            value,

            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseBloc()..add(FetchExercises(widget.bodyPart)),

      child: Scaffold(
        backgroundColor: AppColors.background,

        appBar: AppBar(
          backgroundColor: Colors.transparent,

          elevation: 0,

          title: Text('${widget.bodyPart} Exercises'),
        ),

        body: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            if (state is ExerciseLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ExerciseLoaded) {
              List<Model> exerciseList = state.exercises;

              return ListView.builder(
                itemCount: exerciseList.length,

                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,

                    color: const Color(0xFF1F1F1F),

                    shadowColor: Colors.black.withOpacity(0.35),

                    margin: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailScreen(
                              exercise: exerciseList[index],
                            ),
                          ),
                        );
                      },

                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),

                      leading: CircleAvatar(
                        radius: 24,

                        backgroundColor: AppColors.primary.withOpacity(0.15),

                        child: Icon(
                          Icons.fitness_center,

                          color: AppColors.primary,
                        ),
                      ),

                      title: Text(
                        exerciseList[index].name.toString(),

                        style: const TextStyle(
                          color: Colors.white,

                          fontWeight: FontWeight.w700,

                          fontSize: 16,
                        ),
                      ),

                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5),

                        child: Text(
                          exerciseList[index].equipment.toString(),

                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),

                            fontSize: 13,
                          ),
                        ),
                      ),

                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.12),

                          borderRadius: BorderRadius.circular(30),
                        ),

                        child: Text(
                          exerciseList[index].target.toString(),

                          style: TextStyle(
                            color: AppColors.primary,

                            fontWeight: FontWeight.w700,

                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            if (state is ExerciseError) {
              return Center(
                child: Text(
                  state.message,

                  style: const TextStyle(color: Colors.white),
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
