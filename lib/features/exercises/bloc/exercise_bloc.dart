import 'package:bloc/bloc.dart';
import 'package:lift_app/features/exercises/models/exercise_model.dart';
import 'package:lift_app/features/exercises/services/exercise_service.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final ExerciseService exerciseService = ExerciseService();

  ExerciseBloc() : super(ExerciseInitial()) {
    on<FetchExercises>((event, emit) async {
      emit(ExerciseLoading());

      try {
        final exercises = await exerciseService.fetchExercises(event.bodyPart);

        emit(ExerciseLoaded(exercises));
      } catch (e) {
        emit(ExerciseError(e.toString()));
      }
    });
  }
}
