import 'package:myanmar_political_studies/data/models/QuizResponse.dart';
import 'package:meta/meta.dart';

@immutable
abstract class QuizScreenState {}

class InitialQuizScreenState extends QuizScreenState {}

class LoadedQuizScreenState extends QuizScreenState {
  final QuizResponse quizResponse;

  LoadedQuizScreenState(this.quizResponse);
}
