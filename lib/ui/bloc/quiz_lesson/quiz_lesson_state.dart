import 'package:myanmar_political_studies/data/models/QuizResponse.dart';
import 'package:meta/meta.dart';

@immutable
abstract class QuizLessonState {}

class InitialQuizLessonState extends QuizLessonState {}

class LoadedQuizLessonState extends QuizLessonState {
  final QuizResponse quizResponse;

  LoadedQuizLessonState(this.quizResponse);
}
