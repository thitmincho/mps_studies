import 'package:myanmar_political_studies/data/models/QuizResponse.dart';
import 'package:meta/meta.dart';

@immutable
abstract class QuizScreenEvent {}

class FetchEvent extends QuizScreenEvent {
  final int courseId;
  final int lessonId;
  final QuizResponse quizResponse;

  FetchEvent(this.courseId, this.lessonId, this.quizResponse);
}
