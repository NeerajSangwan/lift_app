part of 'exercise_bloc.dart';

sealed class ExerciseEvent {}

final class FetchExercises extends ExerciseEvent {
  final String bodyPart;

  FetchExercises(this.bodyPart);
}
