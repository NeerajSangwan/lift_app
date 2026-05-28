part of 'exercise_bloc.dart';

sealed class ExerciseState {}

final class ExerciseInitial extends ExerciseState {}

final class ExerciseLoading extends ExerciseState {}

final class ExerciseLoaded extends ExerciseState {
  final List<Model> exercises;

  ExerciseLoaded(this.exercises);
}

final class ExerciseError extends ExerciseState {
  final String message;

  ExerciseError(this.message);
}
