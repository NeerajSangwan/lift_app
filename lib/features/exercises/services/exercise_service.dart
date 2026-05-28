import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lift_app/features/exercises/models/exercise_model.dart';

class ExerciseService {
  Future<List<Model>> fetchExercises(String bodyPart) async {
    List<Model> exerciseList = [];

    final response = await http.get(
      Uri.parse(
        'https://exercisedb.p.rapidapi.com/exercises/bodyPart/$bodyPart?sortMethod=bodyPart&sortOrder=ascending&limit=10&offset=0',
      ),

      headers: {
        'Content-Type': 'application/json',

        'x-rapidapi-host': 'exercisedb.p.rapidapi.com',

        'x-rapidapi-key': '5116375f59mshbccdb11b199708ap1ecbf5jsn49115f46b41a',
      },
    );

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        exerciseList.add(Model.fromJson(i));
      }

      return exerciseList;
    } else {
      return [];
    }
  }
}
