import 'dart:convert';
import 'package:captain11/models/exercise_model.dart';
import 'package:captain11/providers/base_provider.dart';


class ExercisesProvider extends BaseProvider{
  List<ExerciseModel> exercises = [];

  getExercises() async
  {
    setLoading(true);
    exercises.clear();

    var response = await api.get("https://api.api-ninjas.com/v1/exercises", headers: {
      'X-Api-Key' : 'yGHrbqXSfraa1dxv5V48RQ==jSyDpvL031ISiu9i'
    });

    if (response.statusCode == 200)
    {
      var data = jsonDecode(response.body);

      for (var item in data)
      {
        exercises.add(ExerciseModel.fromJson(item));
      }
     
      setLoading(false);
    }
  }

}